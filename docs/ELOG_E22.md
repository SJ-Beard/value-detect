# Drop-in entry for `docs/EXPERIMENTS.md` (kept in our repo; Gunnar's log untouched)

---

## E22 — Value-discovery v2: convention benchmark across worlds (2026-08-12)

**Why:** E21 validated the value signature on the handle-world but showed no single
test generalizes. E22 benchmarks six tests across four worlds to find which measurement
philosophies survive outside their birth world, incl. two block-level architectures
built on the E7/P1-style detection stage (agents fused into compressed macro-state
blocks; environment never fused).

**Setup:** {anchor (handle-world), colony (8 ring-coupled handle agents, 49 vars),
deep-synergy (parity vs majority composition), slow-meter (0.5% goal + 4 inert meters)}
× {pairwise (retired), fused, fused+best-key, grown-keys k=2, fused-agents own-block,
fused-agents any-block} × {main, no-core, scramble} × 20 seeds. Signature criteria locked pre-sweep
(z=3 margin floors, net-ratio 9×, per-world uniqueness ≤2/20). Detection: swept dial ×
viable-coverage selection (blanket-valid blocks with top-64 compression lost-mass <10%;
ties → more clusters). PYTHONHASHSEED=0; 2k burn-in on the decoupled sim.

**Key results (goal-recovery, fraction of seeds):**

| Test | anchor | colony (8 goals, min) | deep-syn G_P | deep-syn G_M | slow-meter |
|---|---|---|---|---|---|
| fused | 1.00 | — (scale wall) | — | — | — |
| best-key | 1.00 | intake-infeasible | 0.00 (cliff) | 1.00 | 1.00 |
| grown | 1.00 | intake-infeasible | 0.45 (cliff) | 1.00 | 1.00 |
| own-block | 1.00 | 0.70 → 0.90 partitioned | 0.00 (orphan, no ring) | 1.00 | 1.00 |
| **any-block** | **1.00** | **1.00** | **1.00** | **1.00** | **1.00** |

Controls: no-core caught the keyed-intake saturation at colony scale (19,999/20,000
unique joint-Rest states ⇒ intake = bias; declared infeasible per locked rules);
scramble calibration nominal; slow-meter witness-watch ≈0 for keyed tests, 8–9/20
saturating-meter thefts for block tests (concentration cost, recorded). Registered
partitioned-colony attribution: key-ring shortfall and the one systematic thief (A6)
traced to **interference, not scale** (6/20 → 2/20).

**Defects found & fixed mid-run (documented):** deep-synergy channels initially shared
one action drive (E1⊕E2 change rate 5.7% ⇒ parity collapsed; fixed with an exogenous
channel; audit now checks joint dynamics); feasibility map missed the keyed-intake wall.

**Conclusions:** the block philosophy (fuse discovered agents; never the environment;
offer every block as a key) is the only approach whole at Gunnar-scale; any-block is
the programme's primary test going forward (fused = small-world gold standard; grown
keys reserve; own-block diagnostic — its divergence from any-block measures partition
quality). Any-block requires no assumption about which agent owns a goal ⇒ structurally open to
coalition-held goals (v3+ direction). v3 (designed): colony-only curve-balls — two puppet-colonies (captured
goals, fast/slow), alias-colony (noise-swept goal twins), and a two-direction
interventional yardstick (goal-role probe + autonomy probe) with an access-premium
table; any-block primary, own-block diagnostic.

**Artifacts:** `results/v2_5/V2_VERDICT.md`, `v2_heatmap.png`, world audits in
`results/v2_4/`, registration `docs/V2_5_PREREGISTRATION.md`, glossary
`docs/DEFINITIONS.md`, decisions log `docs/DECISIONS.md`.

**Reproduce:**

```bash
~/.venvs/value-detect/bin/python value_detect/scripts/v2_5_sweep.py --seeds 20 --jobs 4
~/.venvs/value-detect/bin/python value_detect/scripts/v2_5_anchor_fused_nulls.py
~/.venvs/value-detect/bin/python value_detect/scripts/v2_5_aggregate.py
```
