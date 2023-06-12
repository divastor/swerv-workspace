#  NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
#  This is an automatically generated file by stavros on Τετ 02 Μαρ 2022 07:35:18 μμ EET
# 
#  cmd:    swerv -snapshot=swerv-app -unset=assert_on -set=reset_vec=0x80000000 -set=fpga_optimize=1 
# 
# To use this in a perf script, use 'require $RV_ROOT/configs/config.pl'
# Reference the hash via $config{name}..


%config = (
            'reset_vec' => '0x80000000',
            'csr' => {
                       'mimpid' => {
                                     'exists' => 'true',
                                     'reset' => '0x6',
                                     'mask' => '0x0'
                                   },
                       'pmpcfg2' => {
                                      'exists' => 'false'
                                    },
                       'meipt' => {
                                    'mask' => '0xf',
                                    'reset' => '0x0',
                                    'exists' => 'true',
                                    'number' => '0xbc9',
                                    'comment' => 'External interrupt priority threshold.'
                                  },
                       'mhpmcounter6h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'pmpcfg3' => {
                                      'exists' => 'false'
                                    },
                       'mie' => {
                                  'reset' => '0x0',
                                  'mask' => '0x70000888',
                                  'exists' => 'true'
                                },
                       'time' => {
                                   'exists' => 'false'
                                 },
                       'pmpcfg1' => {
                                      'exists' => 'false'
                                    },
                       'mhpmevent6' => {
                                         'reset' => '0x0',
                                         'mask' => '0xffffffff',
                                         'exists' => 'true'
                                       },
                       'mcounteren' => {
                                         'exists' => 'false'
                                       },
                       'pmpaddr2' => {
                                       'exists' => 'false'
                                     },
                       'marchid' => {
                                      'exists' => 'true',
                                      'mask' => '0x0',
                                      'reset' => '0x0000000b'
                                    },
                       'mfdc' => {
                                   'reset' => '0x00070040',
                                   'mask' => '0x000727ff',
                                   'exists' => 'true',
                                   'number' => '0x7f9'
                                 },
                       'micect' => {
                                     'reset' => '0x0',
                                     'mask' => '0xffffffff',
                                     'exists' => 'true',
                                     'number' => '0x7f0'
                                   },
                       'mhpmcounter4' => {
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff',
                                           'exists' => 'true'
                                         },
                       'instret' => {
                                      'exists' => 'false'
                                    },
                       'pmpcfg0' => {
                                      'exists' => 'false'
                                    },
                       'mhpmcounter3' => {
                                           'reset' => '0x0',
                                           'mask' => '0xffffffff',
                                           'exists' => 'true'
                                         },
                       'mcgc' => {
                                   'mask' => '0x000001ff',
                                   'reset' => '0x0',
                                   'exists' => 'true',
                                   'poke_mask' => '0x000001ff',
                                   'number' => '0x7f8'
                                 },
                       'mhpmevent3' => {
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0',
                                         'exists' => 'true'
                                       },
                       'pmpaddr4' => {
                                       'exists' => 'false'
                                     },
                       'mstatus' => {
                                      'exists' => 'true',
                                      'mask' => '0x88',
                                      'reset' => '0x1800'
                                    },
                       'meicidpl' => {
                                       'mask' => '0xf',
                                       'reset' => '0x0',
                                       'number' => '0xbcb',
                                       'exists' => 'true',
                                       'comment' => 'External interrupt claim id priority level.'
                                     },
                       'pmpaddr12' => {
                                        'exists' => 'false'
                                      },
                       'mpmc' => {
                                   'reset' => '0x2',
                                   'mask' => '0x2',
                                   'comment' => 'FWHALT',
                                   'exists' => 'true',
                                   'number' => '0x7c6',
                                   'poke_mask' => '0x2'
                                 },
                       'pmpaddr0' => {
                                       'exists' => 'false'
                                     },
                       'mip' => {
                                  'mask' => '0x0',
                                  'reset' => '0x0',
                                  'exists' => 'true',
                                  'poke_mask' => '0x70000888'
                                },
                       'mcountinhibit' => {
                                            'exists' => 'false'
                                          },
                       'mitbnd1' => {
                                      'mask' => '0xffffffff',
                                      'reset' => '0xffffffff',
                                      'number' => '0x7d6',
                                      'exists' => 'true'
                                    },
                       'miccmect' => {
                                       'number' => '0x7f1',
                                       'exists' => 'true',
                                       'reset' => '0x0',
                                       'mask' => '0xffffffff'
                                     },
                       'mitcnt1' => {
                                      'exists' => 'true',
                                      'number' => '0x7d5',
                                      'mask' => '0xffffffff',
                                      'reset' => '0x0'
                                    },
                       'dicad1' => {
                                     'exists' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0x3',
                                     'reset' => '0x0',
                                     'debug' => 'true',
                                     'number' => '0x7ca'
                                   },
                       'mgpmc' => {
                                    'exists' => 'true',
                                    'number' => '0x7d0',
                                    'mask' => '0x1',
                                    'reset' => '0x1'
                                  },
                       'mdccmect' => {
                                       'number' => '0x7f2',
                                       'exists' => 'true',
                                       'mask' => '0xffffffff',
                                       'reset' => '0x0'
                                     },
                       'mhpmcounter5' => {
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0',
                                           'exists' => 'true'
                                         },
                       'meicurpl' => {
                                       'comment' => 'External interrupt current priority level.',
                                       'exists' => 'true',
                                       'number' => '0xbcc',
                                       'reset' => '0x0',
                                       'mask' => '0xf'
                                     },
                       'mitcnt0' => {
                                      'mask' => '0xffffffff',
                                      'reset' => '0x0',
                                      'exists' => 'true',
                                      'number' => '0x7d2'
                                    },
                       'cycle' => {
                                    'exists' => 'false'
                                  },
                       'mitbnd0' => {
                                      'mask' => '0xffffffff',
                                      'reset' => '0xffffffff',
                                      'number' => '0x7d3',
                                      'exists' => 'true'
                                    },
                       'mitctl0' => {
                                      'exists' => 'true',
                                      'number' => '0x7d4',
                                      'mask' => '0x00000007',
                                      'reset' => '0x1'
                                    },
                       'pmpaddr10' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr9' => {
                                       'exists' => 'false'
                                     },
                       'misa' => {
                                   'mask' => '0x0',
                                   'reset' => '0x40001104',
                                   'exists' => 'true'
                                 },
                       'dicago' => {
                                     'number' => '0x7cb',
                                     'debug' => 'true',
                                     'mask' => '0x0',
                                     'reset' => '0x0',
                                     'exists' => 'true',
                                     'comment' => 'Cache diagnostics.'
                                   },
                       'pmpaddr8' => {
                                       'exists' => 'false'
                                     },
                       'mitctl1' => {
                                      'exists' => 'true',
                                      'number' => '0x7d7',
                                      'mask' => '0x00000007',
                                      'reset' => '0x1'
                                    },
                       'meicpct' => {
                                      'exists' => 'true',
                                      'number' => '0xbca',
                                      'comment' => 'External claim id/priority capture.',
                                      'mask' => '0x0',
                                      'reset' => '0x0'
                                    },
                       'pmpaddr7' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr13' => {
                                        'exists' => 'false'
                                      },
                       'mhpmcounter5h' => {
                                            'exists' => 'true',
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0'
                                          },
                       'mhpmevent4' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'dcsr' => {
                                   'poke_mask' => '0x00008dcc',
                                   'exists' => 'true',
                                   'mask' => '0x00008c04',
                                   'reset' => '0x40000003'
                                 },
                       'pmpaddr5' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr6' => {
                                       'exists' => 'false'
                                     },
                       'mhpmcounter6' => {
                                           'exists' => 'true',
                                           'mask' => '0xffffffff',
                                           'reset' => '0x0'
                                         },
                       'pmpaddr3' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr14' => {
                                        'exists' => 'false'
                                      },
                       'mcpc' => {
                                   'exists' => 'true',
                                   'number' => '0x7c2',
                                   'mask' => '0x0',
                                   'reset' => '0x0'
                                 },
                       'dicawics' => {
                                       'mask' => '0x0130fffc',
                                       'reset' => '0x0',
                                       'exists' => 'true',
                                       'comment' => 'Cache diagnostics.',
                                       'debug' => 'true',
                                       'number' => '0x7c8'
                                     },
                       'tselect' => {
                                      'reset' => '0x0',
                                      'mask' => '0x3',
                                      'exists' => 'true'
                                    },
                       'mvendorid' => {
                                        'reset' => '0x45',
                                        'mask' => '0x0',
                                        'exists' => 'true'
                                      },
                       'dmst' => {
                                   'number' => '0x7c4',
                                   'debug' => 'true',
                                   'exists' => 'true',
                                   'comment' => 'Memory synch trigger: Flush caches in debug mode.',
                                   'mask' => '0x0',
                                   'reset' => '0x0'
                                 },
                       'dicad0' => {
                                     'number' => '0x7c9',
                                     'debug' => 'true',
                                     'exists' => 'true',
                                     'comment' => 'Cache diagnostics.',
                                     'mask' => '0xffffffff',
                                     'reset' => '0x0'
                                   },
                       'pmpaddr11' => {
                                        'exists' => 'false'
                                      },
                       'pmpaddr1' => {
                                       'exists' => 'false'
                                     },
                       'pmpaddr15' => {
                                        'exists' => 'false'
                                      },
                       'mhpmevent5' => {
                                         'exists' => 'true',
                                         'mask' => '0xffffffff',
                                         'reset' => '0x0'
                                       },
                       'mhpmcounter4h' => {
                                            'reset' => '0x0',
                                            'mask' => '0xffffffff',
                                            'exists' => 'true'
                                          },
                       'mhpmcounter3h' => {
                                            'exists' => 'true',
                                            'mask' => '0xffffffff',
                                            'reset' => '0x0'
                                          }
                     },
            'max_mmode_perf_event' => '50',
            'numiregs' => '32',
            'protection' => {
                              'data_access_mask5' => '0xffffffff',
                              'data_access_mask2' => '0xffffffff',
                              'inst_access_enable1' => '0x0',
                              'data_access_mask7' => '0xffffffff',
                              'data_access_addr1' => '0x00000000',
                              'data_access_enable6' => '0x0',
                              'inst_access_addr4' => '0x00000000',
                              'data_access_enable0' => '0x0',
                              'data_access_mask0' => '0xffffffff',
                              'data_access_addr6' => '0x00000000',
                              'data_access_enable3' => '0x0',
                              'data_access_mask3' => '0xffffffff',
                              'data_access_enable4' => '0x0',
                              'data_access_addr3' => '0x00000000',
                              'data_access_enable5' => '0x0',
                              'data_access_mask6' => '0xffffffff',
                              'data_access_addr0' => '0x00000000',
                              'inst_access_mask4' => '0xffffffff',
                              'data_access_mask1' => '0xffffffff',
                              'data_access_addr7' => '0x00000000',
                              'inst_access_enable7' => '0x0',
                              'inst_access_enable2' => '0x0',
                              'data_access_addr5' => '0x00000000',
                              'data_access_addr2' => '0x00000000',
                              'inst_access_mask7' => '0xffffffff',
                              'inst_access_mask5' => '0xffffffff',
                              'data_access_enable1' => '0x0',
                              'inst_access_mask2' => '0xffffffff',
                              'inst_access_enable6' => '0x0',
                              'inst_access_addr1' => '0x00000000',
                              'inst_access_enable3' => '0x0',
                              'inst_access_mask3' => '0xffffffff',
                              'inst_access_enable0' => '0x0',
                              'data_access_addr4' => '0x00000000',
                              'inst_access_addr6' => '0x00000000',
                              'inst_access_mask0' => '0xffffffff',
                              'inst_access_addr0' => '0x00000000',
                              'inst_access_mask6' => '0xffffffff',
                              'data_access_mask4' => '0xffffffff',
                              'inst_access_enable5' => '0x0',
                              'inst_access_addr3' => '0x00000000',
                              'inst_access_enable4' => '0x0',
                              'inst_access_mask1' => '0xffffffff',
                              'inst_access_addr5' => '0x00000000',
                              'inst_access_addr2' => '0x00000000',
                              'data_access_enable2' => '0x0',
                              'data_access_enable7' => '0x0',
                              'inst_access_addr7' => '0x00000000'
                            },
            'bht' => {
                       'bht_addr_hi' => 7,
                       'bht_ghr_range' => '4:0',
                       'bht_array_depth' => 16,
                       'bht_size' => 128,
                       'bht_hash_string' => '{ghr[3:2] ^ {ghr[3+1], {4-1-2{1\'b0} } },hashin[5:4]^ghr[2-1:0]}',
                       'bht_ghr_pad2' => 'fghr[4:3],2\'b0',
                       'bht_ghr_size' => 5,
                       'bht_addr_lo' => '4',
                       'bht_ghr_pad' => 'fghr[4],3\'b0'
                     },
            'memmap' => {
                          'unused_region3' => '0x30000000',
                          'unused_region6' => '0x60000000',
                          'external_data' => '0xc0580000',
                          'unused_region2' => '0x20000000',
                          'unused_region7' => '0x70000000',
                          'unused_region9' => '0x90000000',
                          'consoleio' => '0xd0580000',
                          'unused_region1' => '0x10000000',
                          'unused_region4' => '0x40000000',
                          'debug_sb_mem' => '0xb0580000',
                          'unused_region5' => '0x50000000',
                          'unused_region0' => '0x00000000',
                          'serialio' => '0xd0580000',
                          'external_data_1' => '0x00000000',
                          'external_prog' => '0xb0000000'
                        },
            'testbench' => {
                             'build_axi4' => '1',
                             'assert_on' => '',
                             'ext_addrwidth' => '32',
                             'clock_period' => '100',
                             'sterr_rollback' => '0',
                             'SDVT_AHB' => '1',
                             'CPU_TOP' => '`RV_TOP.swerv',
                             'lderr_rollback' => '1',
                             'datawidth' => '64',
                             'ext_datawidth' => '64',
                             'TOP' => 'tb_top',
                             'RV_TOP' => '`TOP.rvtop'
                           },
            'btb' => {
                       'btb_index3_lo' => 8,
                       'btb_addr_lo' => '4',
                       'btb_index1_lo' => '4',
                       'btb_btag_size' => 9,
                       'btb_btag_fold' => 1,
                       'btb_index2_lo' => 6,
                       'btb_size' => 32,
                       'btb_index3_hi' => 9,
                       'btb_array_depth' => 4,
                       'btb_index1_hi' => 5,
                       'btb_index2_hi' => 7,
                       'btb_addr_hi' => 5
                     },
            'iccm' => {
                        'iccm_eadr' => '0xee07ffff',
                        'iccm_bits' => 19,
                        'iccm_rows' => '16384',
                        'iccm_offset' => '0xe000000',
                        'iccm_bank_bits' => 3,
                        'iccm_sadr' => '0xee000000',
                        'iccm_reserved' => '0x1000',
                        'iccm_size' => 512,
                        'iccm_size_512' => '',
                        'iccm_index_bits' => 14,
                        'iccm_region' => '0xe',
                        'iccm_data_cell' => 'ram_16384x39',
                        'iccm_num_banks_8' => '',
                        'iccm_num_banks' => '8'
                      },
            'triggers' => [
                            {
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ]
                            },
                            {
                              'poke_mask' => [
                                               '0x081810c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'mask' => [
                                          '0x081810c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ]
                            },
                            {
                              'poke_mask' => [
                                               '0x081818c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'mask' => [
                                          '0x081818c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ]
                            },
                            {
                              'poke_mask' => [
                                               '0x081810c7',
                                               '0xffffffff',
                                               '0x00000000'
                                             ],
                              'reset' => [
                                           '0x23e00000',
                                           '0x00000000',
                                           '0x00000000'
                                         ],
                              'mask' => [
                                          '0x081810c7',
                                          '0xffffffff',
                                          '0x00000000'
                                        ]
                            }
                          ],
            'harts' => 1,
            'bus' => {
                       'lsu_bus_tag' => 4,
                       'sb_bus_tag' => '1',
                       'dma_bus_tag' => '1',
                       'ifu_bus_tag' => '3'
                     },
            'xlen' => 32,
            'physical' => '1',
            'verilator' => '',
            'dccm' => {
                        'dccm_num_banks' => '8',
                        'dccm_width_bits' => 2,
                        'dccm_num_banks_8' => '',
                        'dccm_data_cell' => 'ram_2048x39',
                        'dccm_size_64' => '',
                        'dccm_enable' => '1',
                        'dccm_region' => '0xf',
                        'dccm_index_bits' => 11,
                        'dccm_byte_width' => '4',
                        'dccm_size' => 64,
                        'dccm_reserved' => '0x1000',
                        'dccm_data_width' => 32,
                        'dccm_sadr' => '0xf0040000',
                        'dccm_offset' => '0x40000',
                        'dccm_bank_bits' => 3,
                        'dccm_fdata_width' => 39,
                        'dccm_rows' => '2048',
                        'dccm_bits' => 16,
                        'dccm_ecc_width' => 7,
                        'dccm_eadr' => '0xf004ffff',
                        'lsu_sb_bits' => 16
                      },
            'retstack' => {
                            'ret_stack_size' => '4'
                          },
            'pic' => {
                       'pic_size' => 32,
                       'pic_meigwclr_offset' => '0x5000',
                       'pic_mpiccfg_offset' => '0x3000',
                       'pic_mpiccfg_count' => 1,
                       'pic_meie_mask' => '0x1',
                       'pic_meigwclr_count' => 8,
                       'pic_meipl_mask' => '0xf',
                       'pic_meipt_count' => 8,
                       'pic_meipt_offset' => '0x3004',
                       'pic_meie_count' => 8,
                       'pic_meip_offset' => '0x1000',
                       'pic_mpiccfg_mask' => '0x1',
                       'pic_meip_mask' => '0x0',
                       'pic_meigwclr_mask' => '0x0',
                       'pic_meigwctrl_count' => 8,
                       'pic_meipl_offset' => '0x0000',
                       'pic_meie_offset' => '0x2000',
                       'pic_meipl_count' => 8,
                       'pic_bits' => 15,
                       'pic_meip_count' => 4,
                       'pic_total_int' => 8,
                       'pic_base_addr' => '0xf00c0000',
                       'pic_meipt_mask' => '0x0',
                       'pic_region' => '0xf',
                       'pic_int_words' => 1,
                       'pic_meigwctrl_offset' => '0x4000',
                       'pic_meigwctrl_mask' => '0x3',
                       'pic_total_int_plus1' => 9,
                       'pic_offset' => '0xc0000'
                     },
            'regwidth' => '32',
            'even_odd_trigger_chains' => 'true',
            'icache' => {
                          'icache_size' => 16,
                          'icache_ic_depth' => 8,
                          'icache_ic_index' => 8,
                          'icache_tag_low' => '6',
                          'icache_tag_depth' => 64,
                          'icache_ic_rows' => '256',
                          'icache_taddr_high' => 5,
                          'icache_tag_high' => 12,
                          'icache_data_cell' => 'ram_256x34',
                          'icache_tag_cell' => 'ram_64x21',
                          'icache_enable' => '1'
                        },
            'nmi_vec' => '0x11110000',
            'core' => {
                        'lsu_num_nbload_width' => '3',
                        'fpga_optimize' => 1,
                        'lsu_num_nbload' => '8',
                        'lsu_stbuf_depth' => '8',
                        'dma_buf_depth' => '4',
                        'dec_instbuf_depth' => '4'
                      },
            'tec_rv_icg' => 'clockhdr',
            'num_mmode_perf_regs' => '4',
            'target' => 'default'
          );
1;
