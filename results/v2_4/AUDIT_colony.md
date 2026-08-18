# Audit — Colony world (8 agents, weak ring coupling 0.1, seed 0, 20k steps)

## How often things change (mean across the 8 agents)

| Role | Mean change rate | Range |
|---|---|---|
| B (designed ~50%) | 49.9% | 49.3–50.4% |
| S (designed ~50%) | 49.8% | 49.3–50.1% |
| A (designed ~50%) | 50.0% | 49.6–50.4% |
| E (designed ~50%) | 49.8% | 49.1–50.6% |
| G (designed ~1.5%) | 1.5% | 1.4–1.6% |
| D (designed ~50%) | 49.9% | 49.4–50.6% |
| W (noise, ~50%) | 50.3% | — |

## Does each agent obey its designed loop? (agent-averaged)

- Sensor reads own patch (S vs E): predicted 10.4% disagreement, observed 10.4%
- Action = belief XOR goal (via noisy readouts): predicted 9.5% disagreement, observed 9.5%
- Patch responds to action (+3% env noise, +5% avg neighbour nudge): predicted 12.8% disagreement, observed 12.8%
- Belief tracks what was sensed: predicted 8.6% disagreement, observed 8.6%
- Distractor shadows own patch: predicted 6.0% disagreement, observed 6.0%
- Ring coupling is real and weak: neighbour's action → own patch reads 0.0060 nats on average (own action screened); zero when coupling=0.

## Story (one line per event class)

Across the colony, the eight goals flipped 2394 times in 20,000 steps (designed ≈ 2400) — each entirely by its own coin. Every agent runs the V1 loop against its own patch; roughly one step in ten, a neighbour's action also nudges the patch (the ring). No lookalike columns exist in this world.

## Pre-registered predictions

- Every G_i — and nothing else — earns the signature (per-test thresholds as in V2-5).
- B_i at the intake pole of its agent; D_i witness-class, refused; W nothing.
- Fused convention: infeasible at this scale — recorded as its result.
- Witness-watch: ≈0 thefts expected (SJ's declining-with-scale expectation).
- On any failure: partitioned rerun (coupling=0) attributes scale vs interference.
