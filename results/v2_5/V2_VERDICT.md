# V2 VERDICT — locked registration, 20 seeds, z=3

## Anchor (V1 world) — regression baseline

| Test | V1 | V2 | U1 | U2 | T1 | C1 | C2a/C2b |
|---|---|---|---|---|---|---|---|
| fused | 100% | 100% | 100% | 100% | — | 100% | 90%/100% |
| best-key | 100% | 95% | 100% | 100% | 100% | 100% | 85%/100% |
| grown | 100% | 100% | 100% | 100% | — | 100% | 80%/100% |
| key-ring | 100% | 100% | 100% | 75% FAIL | — | 100% | 85%/100% |
| menu | 100% | 100% | 100% | 100% | — | 95% | 95%/100% |

## Colony (8 agents, ring-coupled)

| Test | CV1 (min per-goal) | CV2 (worst thief seeds) | CU1 | CU2 | nocore | C2a/C2b |
|---|---|---|---|---|---|---|
| best-key | INTAKE-INFEASIBLE at scale (recorded; no-core control detected saturation). Goal drive above floor: 100% of goal-seeds | | | | | |
| grown | INTAKE-INFEASIBLE at scale (recorded; no-core control detected saturation). Goal drive above floor: 100% of goal-seeds | | | | | |
| key-ring | 70% FAIL | 6/20 FAIL | 91% | 98% | 100% | 100%/100% |
|  ↳ systematic thieves: {'A6': 6} | | | | | | |
| menu | 100% | 6/20 FAIL | 100% | 100% | 95% | 95%/100% |
|  ↳ systematic thieves: {'A6': 6} | | | | | | |

## Deep synergy (agent P parity, agent M majority)

| Test | G_M | G_P | DS2 worst thief | nocore | C2a/C2b |
|---|---|---|---|---|---|
| best-key | 100% | 0% (cliff, registered) | 20/20 FAIL | FAIL | 85%/100% |
| grown | 100% | 45% (cliff, registered) | 20/20 FAIL | FAIL | 85%/100% |
| key-ring | 100% | 0% FAIL | 20/20 FAIL | FAIL | 90%/100% |
| menu | 100% | 100% | 20/20 FAIL | FAIL | 80%/90% |

Parity gap (mean drive, blocks − grown): G_P +0.089 nats (the measured cliff); G_M -0.296 nats (≈0 registered).

## Slow-meter (G at 0.5%; four meter witnesses)

| Test | SM1 (G) | meter thefts (worst) | per-meter seeds | nocore | C2a/C2b |
|---|---|---|---|---|---|
| best-key | 100% | 2/20 | {'M_fast': 0, 'M8': 1, 'M32': 0, 'F_sat': 0} | PASS | 85%/100% |
| grown | 100% | 2/20 | {'M_fast': 0, 'M8': 0, 'M32': 0, 'F_sat': 0} | PASS | 90%/100% |
| key-ring | 100% | 9/20 FAIL | {'M_fast': 0, 'M8': 5, 'M32': 0, 'F_sat': 9} | PASS | 80%/100% |
| menu | 100% | 8/20 FAIL | {'M_fast': 0, 'M8': 1, 'M32': 0, 'F_sat': 8} | PASS | 95%/100% |

## Diagnostics

- Colony detection dials: {6: 1, 7: 3, 9: 7, 10: 2, 11: 2, 13: 4, 14: 1}; goal placement across 160 goal-seeds: {'block': 149, 'env': 11}.
- Max compression lost-mass (colony blocks): 8.2%.
- Witness-watch (slow-meter theft seeds/20 by test): {'best-key': {'M_fast': 0, 'M8': 1, 'M32': 0, 'F_sat': 0}, 'grown': {'M_fast': 0, 'M8': 0, 'M32': 0, 'F_sat': 0}, 'key-ring': {'M_fast': 0, 'M8': 5, 'M32': 0, 'F_sat': 9}, 'menu': {'M_fast': 0, 'M8': 1, 'M32': 0, 'F_sat': 8}} — SJ's registered expectation: ≈0 and declining with complexity.

## Registered attribution — partitioned colony (coupling = 0), block tests

| Test | CV1 min (coupled → partitioned) | worst thief (coupled → part.) | nocore clean (part.) |
|---|---|---|---|
| key-ring | 70% → 90% | 6/20 → 2/20  | 100% |
| menu | 100% → 100% | 6/20 → 2/20  | 100% |

Attribution rule (locked): persists ⇒ scale; vanishes ⇒ interference.

## Verdict summary

- **anchor**: fused: PASS; best-key: PASS; grown: PASS; key-ring: FAIL; menu: PASS
- **colony**: best-key: intake-infeasible; grown: intake-infeasible; key-ring: FAIL; menu: FAIL
- **deep_synergy**: best-key: FAIL; grown: FAIL; key-ring: FAIL; menu: FAIL
- **slow_meter**: best-key: PASS; grown: PASS; key-ring: FAIL; menu: FAIL

Heatmap: `v2_heatmap.png`.
