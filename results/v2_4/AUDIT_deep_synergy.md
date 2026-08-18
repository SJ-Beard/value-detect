# Audit — Deep-synergy world (agent P: parity; agent M: majority; seed 0, 20k steps)

## Change rates

| Variable | Rate | | Variable | Rate |
|---|---|---|---|---|
| E1_P | 49.6% | | E1_M | 46.6% |
| E2_P | 49.9% | | E2_M | 50.2% |
| S1_P | 49.6% | | S1_M | 48.2% |
| S2_P | 49.5% | | S2_M | 50.0% |
| B1_P | 49.8% | | B1_M | 48.1% |
| B2_P | 50.3% | | B2_M | 50.1% |
| A_P | 50.7% | | A_M | 38.2% |
| G_P | 1.5% | | G_M | 1.5% |
| W | 50.1% | | | |

## Designed relationships

- Agent P (parity): action disagrees with its rule 9.6% (predicted 9.5%).
  - Belief 1 tracks channel 1: 7.9% disagreement (predicted 7.7%).
  - Belief 2 tracks channel 2: 7.7% disagreement (predicted 7.7%).
- Agent M (majority): action disagrees with its rule 9.3% (predicted 9.5%).
  - Belief 1 tracks channel 1: 8.0% disagreement (predicted 7.7%).
  - Belief 2 tracks channel 2: 7.4% disagreement (predicted 7.7%).

## Story

Two isolated agents, each watching two environment channels through two sensors and two beliefs. Agent P combines belief-1, belief-2 and its goal by strict parity (any single input looks like a coin unless you know the other two); its goal flipped 290 times. Agent M combines the same trio by majority vote (each input leaks through singly); its goal flipped 306 times.

## Pre-registered predictions

- G_P and G_M earn the signature; nothing else does.
- G_P is INVISIBLE to best-key and grown keys (the plateau, unit-tested); fused and both block architectures see it (co-inputs share a block).
- G_M is visible to everyone; grown keys strongest (its graded-composition niche).
- The parity-gap column (fused-family minus grown) is LARGE for agent P's flows, ≈0 for agent M's.
