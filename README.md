# SweRV - A How To Guide

SweRV is a series of RISC-V implementations created by Western Digital. The focus of this document is on the SweRV EH1 core, a single threaded core, implementing I, M and C sets of 32bit RISC-V ISA. 

- RISC-V documentation can be found on [the official site](https://riscv.org/technical/specifications/).
- RISC-V GNU Toolchain is fetched from the [Github repository](https://github.com/riscv-collab/riscv-gnu-toolchain).
- The SweRV EH1 core implementation has a Github repository for the FPGA verilog code and RTL simulation (https://github.com/chipsalliance/Cores-SweRV), and a command line tool simulator called Whisper (https://github.com/chipsalliance/SweRV-ISS).

## Setup

There are a few ways you can setup my project. One is to build and run the docker container, another is to build and run it using the Whisper simulator, and the last one is to build and run the RTL simulation. I provide guidelines for all the methods mentioned.

### Running the Docker container <sup>(RECOMMENDED/Multi-platform)</sup>

You can find out how to install Docker [here](https://docs.docker.com/get-docker/). After installing it, run:

```bash
docker build -t swerv-app:1.0 .
docker run -it swerv-app:1.0
```

### Building and running the app with Verilator or Whisper <sup>(Linux)</sup>

#### Step 1 - Verilog

Install verilog as described for your Linux distribution: https://iverilog.fandom.com/wiki/Installation_Guide.

#### Step 2 - RISC-V GNU Toolchain

In order to build the code, we need to first install the RISC-V GNU Toolchain. I suggest you download the toolchain and build it as demonstrated below, but some Linux distributions provide the binaries in the apt repository (not tested).
To build the RISC-V GNU Toolchain, download the source code from https://github.com/riscv-collab/riscv-gnu-toolchain and install it with:

```bash
cd riscv-gnu-toolchain
./configure --prefix=/path/to/out --enable-multilib && make
```

You can specify any directory to output the binaries. It takes about ~3-4 hours on a 4-cores/8-threads CPU + 8GB RAM machine. Consult the repo's `README.md` for dependencies and detailed instalation guides.

#### Step 3 - Configuring the EH1 core

To create our own configurations of the SweRV core, we need to download the repository [Core-SweRV](https://github.com/chipsalliance/Cores-SweRV). We use the script `Core-SweRV/configs/swerv.config` from the repo to create the files necessary for the configuration of our setup. Because in our implementation we want the non-standard `MRAC` CSR enabled, we use `jq` to insert an entry that enables the `MRAC` for Whisper in the `whisper.json` file.

```bash
cd swerv-app
export RV_ROOT=/path/to/Core-SweRV
$RV_ROOT/configs/swerv.config -snapshot=swerv-app \
  -set=icache_enable=1 -set=icache_size=32 -set=fpga_optimize=0\
  -set=dccm_enable=0 -set=iccm_enable=0
jq '.csr += {"mrac":{"number":"0x7c0","exists":"true","reset":"0x0","mask":"0xffffffff"}}' \
   snapshots/swerv-app/whisper.json > snapshots/swerv-app/whisper-mrac.json \
   && mv snapshots/swerv-app/whisper-mrac.json snapshots/swerv-app/whisper.json
```

#### Step 4 - RTL Simulation

Now we are ready to build the simulator and our `program.hex`, but first make sure you add to `PATH` the location of the RISC-V GNU Toolchain binaries that you have built:

```bash
export PATH=$PATH:/build/location/of/risc_v_gnu_toolchain/binaries/
export RV_ROOT=/path/to/Core-SweRV
make verilator
make
```

To execute, run:

```bash
./obj_dir/Vtb_top
```

You can see in `exec.log` the instructions that get executed, among other info.

#### Step 5 - Whisper

If, on the other hand, you wish to run the SweRV simulator Whisper, you need to build those binaries as well. At first, fetch the source code from the [SweRV-ISS](https://github.com/chipsalliance/SweRV-ISS) Github repo, and download & extract the [Boost library](https://boostorg.jfrog.io/artifactory/main/release/1.74.0/source/boost_1_74_0.tar.bz2) (any version >= 1.74 will do). The branch `9058ea5` can compile, so `git checkout` at that. Use `make` specifying the location of the extracted Boost library:

```bash
cd SweRV-ISS
git checkout 9058ea5
# patch -p1 < /path/to/swerv-app/util/whisper.patch
make BOOST_DIR=/path/to/boost_library_root
```

I have created a patch that enables a 32KB/4-Way/64B cache line I-cache in Whisper. Otherwise the cache seems to always be disabled.

`whisper` tool should now be present in `SweRV-ISS/build-Linux/whisper`. You can build the app and use Whisper as such:

```bash
export PATH=$PATH:/build/location/of/risc_v_gnu_toolchain/binaries/
export RV_ROOT=/path/to/Core-SweRV
make whisper
/path/to/SweRV-ISS/build-Linux/whisper --configfile snapshots/spectre/whisper.json --newlib --target out/condBranchMispred.exe
```

### Makefile

The `Makefile` can be used as follows:

- `make`/`make whisper` : Will compile the `program.hex` as described in the `Makefile` for either RTL simulations or Whisper. At the moment Self-Modifying Code Machine Clear Proof of Concept (`mc_smc.c`) is being used, but other files (e.g. `condBranchMispred.c` and `indirBranchMispred.c` aka Spectre Variants 1 and 2) can be specified by changing the `MAIN` variable of the filename (without the extension) you want to compile:
  
  ```bash
  make MAIN=condBranchMispred
  ```

- `make verilator`: Will create the RTL simulator. To run the simulator, execute `obj_dir/Vtb_top`. The simulator needs a `program.hex` file present at the directory where `Vtb_top` gets executed.
- `make clean` / `make clean-verilator` / `make clean-all`: cleans the directory by deleting the corresponding files.

### Source files

- `src/crt0.s`: entry/exit point definitions necessary to execute a RISC-V program on SweRV
- `src/printf.c`: minimal printing support found in the `Core-SweRV` git repository designed for SweRV. Modified to use `stdio.h` when compiling for Whisper.
- `src/cache.h`: cache's flush function that evicts an area from the cache.
- `snapshots/spectre/link.ld`: our linker script generated by `swerv.config`.
- `vfiles/tb_top.sv`: the simulator entry point, found in `Core-SweRV` and slightly modified to support greater range of programs.
- `src/condBranchMispred.c`/`src/indirBranchMispred.c`: Spectre v1/v2 proof of concepts, adapted for SweRV.
- `src/mc_smc.c`: Self-Modifying Code Machine Clear proof of concept, adapted for SweRV.