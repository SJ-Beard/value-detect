# Yardstick validation bench — Gunnar's embedded goal_flip vs our do-style (anchor)

Verdict pattern must agree: exactly the goal shows a role-effect. His score formula on his machinery/world; ours on our 1-agent engine (same designed mechanics).

## His embedded operation (goal_flip attempted on every handle; his score: CMI(active; A | B, E), 3 seeds, n=4000)

| Handle | score (mean) | permutation p95 | verdict |
|---|---|---|---|
| B | 0.0005 | 0.0010 | — |
| S | 0.0005 | 0.0012 | — |
| A | 0.0005 | 0.0010 | — |
| E | 0.0005 | 0.0013 | — |
| G | 0.0036 | 0.0012 | ROLE-EFFECT |
| S_alias | 0.0005 | 0.0014 | — |
| A_alias | 0.0005 | 0.0010 | — |
| D | 0.0005 | 0.0012 | — |
| W | 0.0005 | 0.0010 | — |

## Our do-style flip (1-agent engine, both probes, 3 seeds, n=2000)

| Target | role verdict | autonomy verdict | interventional verdict |
|---|---|---|---|
| G0 | 3/3 | 0/3 | 3/3 |
| B0 | 3/3 | 3/3 | 0/3 |
| E0 | 3/3 | 3/3 | 0/3 |
| S0 | 0/3 | 0/3 | 0/3 |
| A0 | 0/3 | 3/3 | 0/3 |
| D0 | 0/3 | 3/3 | 0/3 |
| G3 slow-puppet | 3/3 | 3/3 | 0/3 |
| G2_alias(0%) | 0/3 | 0/3 | 0/3 |

Agreement check: his operation and ours must both say the goal-slot alone carries a role-effect among the handles; our autonomy probe must additionally clear the true goal (no autonomy effect) while flagging patch-driven variables.
