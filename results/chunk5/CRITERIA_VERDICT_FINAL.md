# Chunk 5 FINAL verdict — 20 seeds, locked criteria

Fused-convention floors pooled across seeds per the locked spec (≥1000 samples per score); pairwise and fused+best-key use their per-seed ≥200-shift floors as locked. PASS/FAIL mechanical.

## Main-world criteria

| Test | V1 | V2 | U1 | U2 | T1 |
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
| (a) fused | 100% (PASS) | 100% (PASS) | 90% (PASS) | 95% (PASS) |
| (b) fused | 100% (PASS) | 90% (PASS) | 90% (PASS) | 100% (PASS) |
| (a) fus+key | 95% (PASS) | 95% (PASS) | 85% (PASS) | 100% (PASS) |
| (b) fus+key | 95% (PASS) | 95% (PASS) | 95% (PASS) | 100% (PASS) |

C3: pairwise 100% (PASS); fused+best-key 70% (FAIL).

## V2 violators (variable: seeds held signature)

- (a) pairwise: A (20/20), A_alias (20/20)
- (b) pairwise: A (20/20)
- (a) fused: W (1/20)
- (a) fus+key: W (1/20)
- (b) fus+key: W (1/20)

## Scramble calibration (pooled above-floor rate; expected ≈ 5%)

- (a) pairwise: 17/520 = 3.3%
- (b) pairwise: 17/400 = 4.2%
- (a) fused: 35/520 = 6.7%
- (b) fused: 19/400 = 4.8%
- (a) fus+key: 30/520 = 5.8%
- (b) fus+key: 18/400 = 4.5%

Final heatmap: `signature_rate_heatmap_final.png`.
