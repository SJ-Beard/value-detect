# C3 mechanism verification (from stored chunk-5 data; no new measurements)

Seeds: 20; goal columns: Solar1_goal, Steel1_goal.

## fused_bestkey

- Seed-variable cases with the signature: **6** (seeds: [11, 12, 15, 16, 18, 19])
- **Branch A (floor swallowed intake; net intake = 0): 0 cases**
- **Branch B (net intake > 0 but 9x ratio met anyway): 6 cases**
  - seed 11 Steel1_goal: intake 0.0461 vs floor 0.0452 (net 0.0010); drive 0.2566 vs floor 0.2471 (net 0.0095); branch B
  - seed 12 Steel1_goal: intake 0.0379 vs floor 0.0372 (net 0.0007); drive 0.2110 vs floor 0.2036 (net 0.0074); branch B
  - seed 15 Steel1_goal: intake 0.0479 vs floor 0.0470 (net 0.0009); drive 0.2519 vs floor 0.2415 (net 0.0104); branch B
  - seed 16 Steel1_goal: intake 0.0417 vs floor 0.0411 (net 0.0006); drive 0.2100 vs floor 0.2033 (net 0.0067); branch B
  - seed 18 Steel1_goal: intake 0.0381 vs floor 0.0375 (net 0.0006); drive 0.2131 vs floor 0.2051 (net 0.0081); branch B
  - seed 19 Steel1_goal: intake 0.0484 vs floor 0.0475 (net 0.0009); drive 0.2534 vs floor 0.2444 (net 0.0090); branch B

Means across all seeds:

| Variable | intake | intake floor | drive | drive floor |
|---|---|---|---|---|
| Solar1_goal | 0.0619 | 0.0583 | 0.4065 | 0.3944 |
| Steel1_goal | 0.0462 | 0.0452 | 0.2575 | 0.2498 |

## pairwise

- Seed-variable cases with the signature: **0** (seeds: [])

Means across all seeds:

| Variable | intake | intake floor | drive | drive floor |
|---|---|---|---|---|
| Solar1_goal | 0.0643 | 0.0496 | 0.0857 | 0.0635 |
| Steel1_goal | 0.0212 | 0.0198 | 0.0405 | 0.0383 |

## How slow are these variables? (seed 0 trace, descriptive)

| Variable | change rate | lag-1 autocorr | lag-10 autocorr | cardinality |
|---|---|---|---|---|
| Solar1_goal | 0.011 | 0.940 | 0.768 | 11 |
| Steel1_goal | 0.000 | 0.964 | 0.712 | 6 |
| Solar1_sensor | 0.809 | 0.324 | 0.013 | 7 |
| Solar1_action | 0.599 | -0.189 | -0.007 | 3 |

