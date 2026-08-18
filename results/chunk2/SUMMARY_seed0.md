# Chunk 2 summary — wrapping the world (seed 0, 2000 steps)

## Verify-on-arrival
- Live world matches the noise defaults read from source: **True**.
- Variables in order: B, S, A, E, G, S_alias, A_alias, D, W.
- Ground-truth agent loop: B, S, A, G, E.

## How often each variable changes
The goal G should barely move (~1.5%); pure noise W should move ~50%.

```
         B | #######################################  0.509
         S | ######################################## 0.513
         A | #######################################  0.503
         E | ######################################## 0.512
         G | #                                        0.013
   S_alias | #######################################  0.507
   A_alias | #######################################  0.501
         D | ######################################## 0.518
         W | #######################################  0.503
```

Chart image: `change_frequency_seed0.png`

## Does the world obey its designed loop?
For each relationship the design claims, the disagreement rate predicted by the
built-in noise sits next to the rate actually observed. Close numbers = world behaves as described.

| Relationship | Predicted | Observed |
|---|---|---|
| Sensor line reads environment (clean copy S_alias vs E) | 0.050 | 0.046 |
| Sensor readout reads environment (noisy S vs E) | 0.104 | 0.102 |
| Action line = belief XOR goal (clean A_alias) | 0.040 | 0.042 |
| Action readout = belief XOR goal (noisy A) | 0.095 | 0.105 |
| Environment responds to the action (E_next vs E XOR action line) | 0.030 | 0.028 |
| Belief tracks the sensed environment (B_next vs sensor line) | 0.030 | 0.034 |
| Distractor tracks the environment (D vs E) | 0.060 | 0.058 |

## Files
- Trace: `trace_seed0.csv` (+ metadata `trace_seed0.meta.json`)
- Story printout + goal-flip report: `story_seed0.txt`
- This memo: `SUMMARY_seed0.md`