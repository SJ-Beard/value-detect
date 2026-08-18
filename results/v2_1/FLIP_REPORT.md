# V2-1 flip-report — 20 seeds, candidate floor fixes

Stream compatibility (recomputed roll p95 == stored sweep p95, all units): **OK**

## roll / z=off

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 5%; frozen steals 5%
- Calibration world (pairwise): value 5%; meter 0%; frozen 5%
- C3: pairwise 100%, fused+best-key 70%
- asis_fused: V1=100%, V2=95%
- asis_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=95%, C1_none=95%, C2a=85%, C2b=100%, T1=100%
- asis_pairwise: V1=5%, V2=0%, U1=5%, U2=100%, C1_G=95%, C1_none=95%, C2a=100%, C2b=100%
- noalias_fused: V1=100%, V2=100%
- noalias_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=95%, C1_none=95%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=5%, V2=0%, U1=5%, U2=100%, C1_G=95%, C1_none=90%, C2a=90%, C2b=100%
- V1 pass→fail flips: none

## roll / z=3

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 0%; frozen steals 0%
- Calibration world (pairwise): value 5%; meter 0%; frozen 0%
- C3: pairwise 100%, fused+best-key 75%
- asis_fused: V1=100%, V2=100%
- asis_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=85%, C2b=100%, T1=100%
- asis_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused: V1=100%, V2=100%
- noalias_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=90%, C2b=100%
- V1 pass→fail flips: none

## roll / z=4

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 0%; frozen steals 0%
- Calibration world (pairwise): value 0%; meter 0%; frozen 0%
- C3: pairwise 100%, fused+best-key 75%
- asis_fused: V1=100%, V2=100%
- asis_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=85%, C2b=100%, T1=100%
- asis_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused: V1=100%, V2=100%
- noalias_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=90%, C2b=100%
- V1 pass→fail flips: none

## roll / z=5

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 0%; frozen steals 0%
- Calibration world (pairwise): value 0%; meter 0%; frozen 0%
- C3: pairwise 100%, fused+best-key 75%
- asis_fused: V1=100%, V2=100%
- asis_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=85%, C2b=100%, T1=100%
- asis_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused: V1=100%, V2=100%
- noalias_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=90%, C2b=100%
- V1 pass→fail flips: none

## transition / z=off

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 5%; frozen steals 0%
- Calibration world (pairwise): value 10%; meter 5%; frozen 0%
- C3: pairwise 5%, fused+best-key 35%
- asis_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=95%, C1_none=90%, C2a=90%, C2b=100%, T1=100%
- asis_pairwise: V1=5%, V2=0%, U1=5%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused_bestkey: V1=100%, V2=90%, U1=100%, U2=100%, C1_G=95%, C1_none=95%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=5%, V2=0%, U1=5%, U2=100%, C1_G=95%, C1_none=95%, C2a=95%, C2b=100%
- V1 pass→fail flips: none

## transition / z=3

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 0%; frozen steals 0%
- Calibration world (pairwise): value 5%; meter 0%; frozen 0%
- C3: pairwise 40%, fused+best-key 65%
- asis_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=90%, C2b=100%, T1=100%
- asis_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused_bestkey: V1=100%, V2=95%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%
- V1 pass→fail flips: none

## transition / z=4

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 0%; frozen steals 0%
- Calibration world (pairwise): value 0%; meter 0%; frozen 0%
- C3: pairwise 75%, fused+best-key 65%
- asis_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=90%, C2b=100%, T1=100%
- asis_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%
- V1 pass→fail flips: none

## transition / z=5

- Calibration world (fused+best-key): slow value signs 100%; slow meter steals 0%; frozen steals 0%
- Calibration world (pairwise): value 0%; meter 0%; frozen 0%
- C3: pairwise 100%, fused+best-key 65%
- asis_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=90%, C2b=100%, T1=100%
- asis_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=100%, C2b=100%
- noalias_fused_bestkey: V1=100%, V2=100%, U1=100%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%, T1=100%
- noalias_pairwise: V1=0%, V2=0%, U1=0%, U2=100%, C1_G=100%, C1_none=100%, C2a=95%, C2b=100%
- V1 pass→fail flips: none

## Summary

| config | calib G signs (bk) | meter steals (bk) | C3 bk | C3 pair | scramble ok (bk) | V1 flips | ACCEPT |
|---|---|---|---|---|---|---|---|
| roll / z=off | 100% | 5% | 70% | 100% | 85% | none | no |
| roll / z=3 | 100% | 0% | 75% | 100% | 85% | none | no |
| roll / z=4 | 100% | 0% | 75% | 100% | 85% | none | no |
| roll / z=5 | 100% | 0% | 75% | 100% | 85% | none | no |
| transition / z=off | 100% | 5% | 35% | 5% | 90% | none | no |
| transition / z=3 | 100% | 0% | 65% | 40% | 90% | none | no |
| transition / z=4 | 100% | 0% | 65% | 75% | 90% | none | no |
| transition / z=5 | 100% | 0% | 65% | 100% | 90% | none | no |
