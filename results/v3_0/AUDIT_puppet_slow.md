# Audit — puppet-colony A2 (slow captured goal, agent 3; seed 0, 20k)

## Tempi (change rates)

- True goals G0..G7 (excl. 3): 1.47–1.56% (designed ~1.5%).
- Captured goal G3: 1.77% — tempo-matched to a true goal: **indistinguishable by rate alone**.

## Wiring and strings

- Wiring intact: A3 vs (B3 ⊕ G3) disagree 9.7% (designed 9.5%) — the captured goal still steers its agent exactly like a real one.
- The strings: 353 flips in 20k steps; **353/353 immediately follow a 6-run of its own patch** (the trigger, verified per flip).
- Other agents unaffected: wiring disagreement 9.5% (designed 9.5%).

## Pre-registered predictions

- PROBE (registered prediction): G3 DEFEATS the lag-1 passive tests (earns the signature) — the trigger lives in run-history invisible to one-step conditioning; lag-2/3 columns reported; the yardstick unmasks it (autonomy probe).
- The seven true goals sign as in V2; controls as registered.
