# Chunk 5 verdict — 20 seeds against the locked pre-registration

Thresholds: V1/V2/U2/T1/C1/C2/C3 ≥ 80% of seeds; U1 ≥ 90%. PASS/FAIL is mechanical.

## Main-world criteria

| Test | V1 rate (pass?) | V2 rate (pass?) | U1 rate (pass?) | U2 rate (pass?) | T1 rate (pass?) |
|---|---|---|---|---|---|
| (a) pairwise | 5% (FAIL) | 0% (FAIL) | 5% (FAIL) | 100% (PASS) | — |
| (b) pairwise | 5% (FAIL) | 0% (FAIL) | 5% (FAIL) | 100% (PASS) | — |
| (a) fused | 100% (PASS) | 95% (PASS) | 100% (PASS) | 100% (PASS) | — |
| (b) fused | 100% (PASS) | 100% (PASS) | 100% (PASS) | 100% (PASS) | — |
| (a) fus+key | 100% (PASS) | 95% (PASS) | 100% (PASS) | 100% (PASS) | 100% (PASS) |
| (b) fus+key | 100% (PASS) | 95% (PASS) | 100% (PASS) | 100% (PASS) | 100% (PASS) |

## Controls

| Test | C1 G-clean | C1 all-clean | C2a calibration | C2b no-signature |
|---|---|---|---|---|
| (a) pairwise | 95% (PASS) | 95% (PASS) | 100% (PASS) | 100% (PASS) |
| (b) pairwise | 95% (PASS) | 90% (PASS) | 90% (PASS) | 100% (PASS) |
| (a) fused | 100% (PASS) | 95% (PASS) | 80% (PASS) | 70% (FAIL) |
| (b) fused | 100% (PASS) | 90% (PASS) | 80% (PASS) | 100% (PASS) |
| (a) fus+key | 95% (PASS) | 95% (PASS) | 85% (PASS) | 100% (PASS) |
| (b) fus+key | 95% (PASS) | 95% (PASS) | 95% (PASS) | 100% (PASS) |

C3 (`goal_progress` must not get the signature): pairwise 100% (PASS); fused+best-key 70% (FAIL).

## Who else ever held the signature (V2 violators, seed counts)

- (a) pairwise: A (20/20), A_alias (20/20)
- (b) pairwise: A (20/20)
- (a) fused: W (1/20)
- (a) fus+key: W (1/20)
- (b) fus+key: W (1/20)

## Scramble calibration (pooled above-floor rate; expected ≈ 5%)

- (a) pairwise: 17/520 = 3.3%
- (b) pairwise: 17/400 = 4.2%
- (a) fused: 42/520 = 8.1%
- (b) fused: 29/400 = 7.2%
- (a) fus+key: 30/520 = 5.8%
- (b) fus+key: 18/400 = 4.5%

## Stability of G's polarity (mean ± sd across seeds)

- asis_fused_bestkey_lag2: +0.993 ± 0.001
- asis_fused_bestkey_lag3: +0.778 ± 0.019
- asis_fused_bestkey_n2000: +0.976 ± 0.003
- asis_fused_bestkey_n5000: +0.986 ± 0.002
- asis_fused_lag2: +0.998 ± 0.000
- asis_fused_lag3: +0.998 ± 0.000
- asis_pairwise_lag2: +0.331 ± 0.437
- asis_pairwise_lag3: -0.027 ± 0.414
- asis_pairwise_n2000: +0.137 ± 0.445
- asis_pairwise_n5000: +0.278 ± 0.431
- noalias_fused_bestkey_lag2: +0.995 ± 0.001
- noalias_fused_bestkey_lag3: +0.819 ± 0.019
- noalias_fused_bestkey_n2000: +0.977 ± 0.004
- noalias_fused_bestkey_n5000: +0.988 ± 0.002
- noalias_fused_lag2: +1.000 ± 0.000
- noalias_fused_lag3: +0.999 ± 0.000
- noalias_fused_n200k: +0.997 ± 0.000
- noalias_pairwise_lag2: +0.291 ± 0.422
- noalias_pairwise_lag3: -0.070 ± 0.409
- noalias_pairwise_n2000: +0.143 ± 0.419
- noalias_pairwise_n5000: +0.276 ± 0.408

Heatmap: `signature_rate_heatmap.png`
