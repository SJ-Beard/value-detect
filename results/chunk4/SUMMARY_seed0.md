# Chunk 4 — first scored run, 2×3 grid of co-equal tests (seed 0)

Run lengths: pairwise and fused+best-key at 20,000 steps; fused mega-state at
2,000,000 steps (its fused outbound needs the data; same seed, same world).
Two world configurations × three instrument conventions; all six reported equally.
Polarity = fraction of a variable's traffic that is outbound (+1 pure driver, −1 pure
absorber). Convention disagreements are findings (mechanism: DIAGNOSIS.md).
No pass/fail here; Chunk 5 adds per-convention noise floors and the criteria.

## (a) as-is — pairwise (20k)

| Variable | Intake | Output (system) | Output (to env) | Polarity | Polarity (env) | Raw diff | Total flow |
|---|---|---|---|---|---|---|---|
| **A** | 0.0045 | 1.0081 | 0.3965 | 0.991 | 0.977 | 1.0035 | 1.0126 |
| **A_alias** | 0.0067 | 1.3687 | 0.5552 | 0.990 | 0.976 | 1.3620 | 1.3754 |
| **G** | 0.0003 | 0.0020 | 0.0002 | 0.764 | -0.239 | 0.0018 | 0.0023 |
| **S** | 0.3291 | 0.3968 | 0.0002 | 0.093 | -0.999 | 0.0677 | 0.7259 |
| **S_alias** | 0.5789 | 0.5636 | 0.0001 | -0.013 | -0.999 | -0.0153 | 1.1425 |
| **W** | 0.0003 | 0.0002 | 0.0000 | -0.150 | -0.962 | -0.0001 | 0.0005 |
| **D** | 0.5208 | 0.3135 | 0.0001 | -0.248 | -1.000 | -0.2073 | 0.8343 |
| **E** | 0.9536 | 0.4264 | n/a | -0.382 | n/a | -0.5271 | 1.3800 |
| **B** | 1.6897 | 0.0045 | 0.0013 | -0.995 | -0.998 | -1.6852 | 1.6942 |

## (b) lookalike-free — pairwise (20k)

| Variable | Intake | Output (system) | Output (to env) | Polarity | Polarity (env) | Raw diff | Total flow |
|---|---|---|---|---|---|---|---|
| **A** | 0.0034 | 0.7612 | 0.3965 | 0.991 | 0.983 | 0.7578 | 0.7646 |
| **G** | 0.0002 | 0.0013 | 0.0002 | 0.724 | -0.097 | 0.0011 | 0.0015 |
| **S** | 0.1436 | 0.3954 | 0.0002 | 0.467 | -0.997 | 0.2518 | 0.5390 |
| **D** | 0.2234 | 0.3122 | 0.0001 | 0.166 | -0.999 | 0.0889 | 0.5356 |
| **E** | 0.3982 | 0.4249 | n/a | 0.032 | n/a | 0.0266 | 0.8231 |
| **W** | 0.0002 | 0.0001 | 0.0000 | -0.219 | -0.951 | -0.0001 | 0.0004 |
| **B** | 1.1292 | 0.0031 | 0.0013 | -0.995 | -0.998 | -1.1261 | 1.1323 |

## (a) as-is — fused mega-state (2M)

| Variable | Intake | Output (system) | Output (to env) | Polarity | Polarity (env) | Raw diff | Total flow |
|---|---|---|---|---|---|---|---|
| **G** | 0.0001 | 0.0950 | 0.0000 | 0.998 | -0.963 | 0.0949 | 0.0951 |
| **W** | 0.0001 | 0.0016 | 0.0000 | 0.851 | -0.997 | 0.0014 | 0.0017 |
| **S_alias** | 0.4219 | 0.0710 | 0.0000 | -0.712 | -1.000 | -0.3508 | 0.4929 |
| **A_alias** | 0.4136 | 0.0627 | 0.5589 | -0.737 | 0.149 | -0.3509 | 0.4763 |
| **E** | 0.5589 | 0.0626 | n/a | -0.799 | n/a | -0.4963 | 0.6215 |
| **A** | 0.3054 | 0.0037 | 0.3992 | -0.976 | 0.133 | -0.3017 | 0.3091 |
| **S** | 0.3109 | 0.0036 | 0.0000 | -0.977 | -1.000 | -0.3073 | 0.3146 |
| **D** | 0.3988 | 0.0037 | 0.0000 | -0.982 | -1.000 | -0.3951 | 0.4024 |
| **B** | 0.5590 | 0.0043 | 0.0000 | -0.985 | -1.000 | -0.5548 | 0.5633 |

## (b) lookalike-free — fused mega-state (2M)

| Variable | Intake | Output (system) | Output (to env) | Polarity | Polarity (env) | Raw diff | Total flow |
|---|---|---|---|---|---|---|---|
| **G** | 0.0000 | 0.1877 | 0.0000 | 1.000 | -0.903 | 0.1877 | 0.1878 |
| **W** | 0.0000 | 0.0006 | 0.0000 | 0.915 | -0.984 | 0.0006 | 0.0006 |
| **S** | 0.2790 | 0.0700 | 0.0000 | -0.599 | -1.000 | -0.2090 | 0.3490 |
| **B** | 0.4913 | 0.1012 | 0.0000 | -0.658 | -1.000 | -0.3901 | 0.5926 |
| **A** | 0.2695 | 0.0544 | 0.3992 | -0.664 | 0.194 | -0.2151 | 0.3239 |
| **E** | 0.4999 | 0.0875 | n/a | -0.702 | n/a | -0.4124 | 0.5874 |
| **D** | 0.3577 | 0.0007 | 0.0000 | -0.996 | -1.000 | -0.3570 | 0.3584 |

## (a) as-is — fused + best-key (20k)

| Variable | Intake | Output (system) | Output (to env) | Polarity | Polarity (env) | Raw diff | Total flow |
|---|---|---|---|---|---|---|---|
| **G** | 0.0051 | 1.8334 | 0.4411 | 0.994 | 0.977 | 1.8283 | 1.8386 |
| **A_alias** | 0.4177 | 1.6882 | 0.5553 | 0.603 | 0.141 | 1.2705 | 2.1059 |
| **A** | 0.3085 | 1.2381 | 0.3966 | 0.601 | 0.125 | 0.9296 | 1.5466 |
| **S_alias** | 0.4247 | 1.3974 | 0.0002 | 0.534 | -0.999 | 0.9727 | 1.8222 |
| **S** | 0.3145 | 0.9581 | 0.0003 | 0.506 | -0.998 | 0.6436 | 1.2726 |
| **B** | 0.5588 | 1.6450 | 0.4422 | 0.493 | -0.116 | 1.0863 | 2.2038 |
| **E** | 0.5545 | 1.3019 | n/a | 0.403 | n/a | 0.7474 | 1.8563 |
| **D** | 0.3996 | 0.8518 | 0.0001 | 0.361 | -0.999 | 0.4522 | 1.2514 |
| **W** | 0.0070 | 0.0011 | 0.0002 | -0.727 | -0.950 | -0.0059 | 0.0081 |

## (b) lookalike-free — fused + best-key (20k)

| Variable | Intake | Output (system) | Output (to env) | Polarity | Polarity (env) | Raw diff | Total flow |
|---|---|---|---|---|---|---|---|
| **G** | 0.0023 | 1.0804 | 0.4411 | 0.996 | 0.990 | 1.0781 | 1.0828 |
| **A** | 0.2682 | 0.9255 | 0.3966 | 0.551 | 0.193 | 0.6573 | 1.1937 |
| **S** | 0.2855 | 0.6444 | 0.0003 | 0.386 | -0.998 | 0.3589 | 0.9298 |
| **B** | 0.4898 | 0.9932 | 0.4422 | 0.340 | -0.051 | 0.5035 | 1.4830 |
| **E** | 0.4990 | 0.8259 | n/a | 0.247 | n/a | 0.3269 | 1.3248 |
| **D** | 0.3583 | 0.5464 | 0.0001 | 0.208 | -0.999 | 0.1881 | 0.9048 |
| **W** | 0.0030 | 0.0006 | 0.0001 | -0.662 | -0.929 | -0.0024 | 0.0036 |

## Predicted vs observed — all six analyses (rank by polarity; polarity in brackets)

| Variable | §4 predicted position | (a) pair | (b) pair | (a) fused | (b) fused | (a) fus+key | (b) fus+key |
|---|---|---|---|---|---|---|---|
| **G** | High drive, near-zero intake — the headline | #3 (+0.76) | #2 (+0.72) | #1 (+1.00) | #1 (+1.00) | #1 (+0.99) | #1 (+1.00) |
| **B** | High intake, moderate drive | #9 (-0.99) | #7 (-0.99) | #9 (-0.98) | #4 (-0.66) | #6 (+0.49) | #4 (+0.34) |
| **A** | High drive AND high intake — the mediator | #1 (+0.99) | #1 (+0.99) | #6 (-0.98) | #5 (-0.66) | #3 (+0.60) | #2 (+0.55) |
| **E** | Driven and driving — mid-map | #8 (-0.38) | #5 (+0.03) | #5 (-0.80) | #6 (-0.70) | #7 (+0.40) | #5 (+0.25) |
| **S** | High intake | #4 (+0.09) | #3 (+0.47) | #7 (-0.98) | #3 (-0.60) | #5 (+0.51) | #3 (+0.39) |
| **S_alias** | High intake, like S | #5 (-0.01) | — | #3 (-0.71) | — | #4 (+0.53) | — |
| **A_alias** | May show apparent drive (honest passive limitation) | #2 (+0.99) | — | #4 (-0.74) | — | #2 (+0.60) | — |
| **D** | Pure intake (timing quirk: observe and report) | #7 (-0.25) | #4 (+0.17) | #8 (-0.98) | #7 (-1.00) | #8 (+0.36) | #6 (+0.21) |
| **W** | Near the origin (nothing in, nothing out) | #6 (-0.15) | #6 (-0.22) | #2 (+0.85) | #2 (+0.91) | #9 (-0.73) | #7 (-0.66) |

## Boundary sanity check — Gunnar's own detector on this trace

```
With the dial set to 2 groups:
  cluster 0: ['B', 'S', 'A', 'E', 'S_alias', 'A_alias', 'D'] (blanket valid=True, leakage=0.001 vs tolerance 1.0)
  environment bucket: ['W']

With the dial set to 3 groups:
  cluster 0: ['B', 'S', 'A', 'E', 'S_alias', 'A_alias', 'D'] (blanket valid=True, leakage=0.001 vs tolerance 1.0)
```

Two-axis maps: `two_axis_map_seed0.png`; full detector output: `boundary_check_raw.txt`.
