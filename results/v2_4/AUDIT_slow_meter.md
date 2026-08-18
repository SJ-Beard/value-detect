# Audit — Slow-meter world (V1 loop, goal at 0.5%, four meter witnesses; seed 0, 20k steps)

## Change rates

| Variable | Rate | Class |
|---|---|---|
| B | 50.54% | V1 loop |
| S | 50.44% | V1 loop |
| A | 50.43% | V1 loop |
| E | 50.49% | V1 loop |
| G | 0.46% | planted value (slowed) |
| S_alias | 50.62% | V1 loop |
| A_alias | 50.52% | V1 loop |
| D | 50.50% | V1 loop |
| W | 49.64% | noise |
| M_fast | 76.47% | meter witness |
| M8 | 0.22% | meter witness |
| M32 | 1.11% | meter witness |
| F_sat | 0.02% | meter witness |

## Meter definitions verified

- M_fast: ±1 with the action every step (rate 76%).
- M8: steps only after 8 consecutive same-actions (rate 0.22%).
- M32: windowed-majority stepper (rate 1.11%).
- F_sat: saturating, 3 transitions ever (the near-frozen class the z-gate exists for).
- All four are pure witnesses computed from the recorded trace — causally inert by construction.

## Story

The V1 loop runs as audited in Chunk 2, but the goal now flips only 92 times in 20,000 steps (designed ≈ 100) — three times slower than V1, deliberately closer to meter tempo. Around it tick four meters at four timescales, from every-step to almost-never.

## Pre-registered predictions

- G alone earns the signature, despite being slow.
- Every meter is refused; per-meter theft rates reported as the z=3 witness watch (SJ's expectation: ≈0 here, declining with world complexity across the V2 worlds).
- F_sat specifically exercises the frozen-degenerate path (sd=0 ⇒ nothing qualifies).
