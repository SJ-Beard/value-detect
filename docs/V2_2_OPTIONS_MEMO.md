# V2-2 options memo — grown keys, after the plateau discovery (2026-08-11)

The Level-1 justifying test failed informatively before any qualification run: greedy
key-growth cannot climb a **flat plateau**. In pure three-way parity (A = B1 ⊕ B2 ⊕ G),
every single key yields zero marginal gain — one key still leaves an XOR mask — so stage
one of the greedy search ranks pure bias noise and usually picks a useless key. Measured
on 20k-step three-input worlds (G's outbound, nats):

| Convention | Pure parity | Graded (majority rule) |
|---|---|---|
| pairwise | 0.000 | 0.178 |
| fused + best-key | 0.001 | 0.215 |
| **grown keys (k=2)** | **0.001 — blind** | **0.308 — best in the stable (+43% over best-key)** |
| fused | **0.519 — only reader** | 0.219 |

So grown keys has a real, measurable niche — **graded multi-input composition**, where
the second key sharpens what single keys only glimpse — and a sharply-defined blind spot
— **pure parity**, where only the fused family's joint conditioning sees anything. (Note
grown ≥ best-key by construction — it maximises over a superset of conditionings — so it
also inherits best-key's witness limitation; the C3-transfer prediction stands, now by
construction rather than conjecture.)

## Options

**A — Exhaustive pairs at depth 2.** Cracks small-world parity but the floors must
mirror it: ~1,000 candidate pairs per flow at colony scale × 200 shifts is out of
compute reach. Would be a small-worlds-only device with a feasibility wall where V2 is
headed.

**B — Greedy as implemented, reframed as the graded-synergy specialist.** *(Recommended)*
Pre-register: expected to excel on graded composition (data above), expected to FAIL
pure parity (plateau, now unit-tested) and C3 (witness inheritance). Build the V2-4
deep-synergy world **dual** — one parity-composed agent, one majority-composed agent —
so the cliff's location is *measured*, answering the open question from the v1
conclusion. Add a standing **"parity gap" diagnostic** (fused-family reading minus
grown-keys reading per flow): a large gap flags parity-like composition in any future
world — same tripwire philosophy as the z=3 choice.

**C — Drop grown keys.** Thins the benchmark to fused / fused+best-key / fused-agents.
Loses the only convention that outperforms everything on graded composition — the
composition style real (non-digital) systems are most likely to use.

**Recommendation: B.** Stopping rule folds into it: fixed cap k_max = 2, max over
stages (no data-dependent stopping — cleanest pre-registration; the plateau result shows
adaptive stopping rules would add nothing greedy can use). Qualification gate (V1 world,
20 seeds, z=3 floors) proceeds after SJ's pick, with C3 expected-fail pre-registered.
