# Unsupervised value discovery — v2: which tests survive outside their birth world?

**SJ Beard, with Claude (implementation & analysis) · 2026-08-12**
*(Companion to `WRITEUP_V1.md`, which introduces UAD and the handle benchmark; terms per `DEFINITIONS.md`; every decision dated in
`DECISIONS.md`; registration locked pre-sweep in `V2_5_PREREGISTRATION.md`.)*

## The question

v1 showed the **value signature** — drives its system while being (nearly) undriven,
scored against procedure-mirroring noise floors — recovers a planted goal in Zarncke's UAD
handle-world (`uad_handles`; see `WRITEUP_V1.md` for background). v2 asked the harder question: which *measurement conventions* survive in
worlds they weren't born in? Six tests × four worlds × three conditions × 20 seeds,
criteria locked before the sweep.

**Tests:** pairwise (v1 baseline, already retired), fused, fused+best-key, grown keys
(greedy 2-key growth), and two *block architectures* built on UAD's detection stage
(SJ's "fused agents + fused environment"): **fused-agents own-block** (the candidate's
own block standing in the conditioning) and **fused-agents any-block** (every block
offered as a decryption key). **Worlds:** the v1 anchor; a
**colony** (8 handle-world agents, ~49 vars, weak ring coupling); a **deep-synergy**
world (two-belief agents; one composes its action by parity, one by majority); a
**slow-meter** world (goal at 0.5% flip amid four causally-inert meters).

## Headline results

1. **Any-block recovered every planted goal in every world** — the only test that never
   missed (see `writeup_figures/v2_heatmap.png`). Mechanically: "target-block's past +
   one key element" is two-block conditioning, which decrypts three-way composition and
   never needs the goal to belong to a detected agent. Since UAD's clustering reliably
   *orphans* goals (rare-flippers have ~no symmetric MI), that robustness is fitness for
   the real terrain, not luck. It also makes any-block structurally open to goals held by
   *systems* of agents rather than individuals — unplanned, and possibly its most
   important property.
2. **Own-block's failures measure detection quality.** Same family, same blocks — but it
   conditions only on the candidate's *own* block, so orphaned goals stay encrypted
   (0% on the parity goal; 70% worst-goal in the coupled colony). Kept as a diagnostic:
   the any-block − own-block divergence is now our partition-quality gauge.
3. **The synergy cliff is measured.** Parity goal G_P: best-key 0%, grown keys 45%
   (realistic worlds leak partial gradients — greedy half-climbs where pure-parity toys
   give it nothing), any-block 100%. Majority goal G_M: 100% for everyone. Pure plateaus
   defeat greedy growth (unit-tested); graded composition is grown keys' niche
   (+43% over best-key).
4. **Every variable-level convention hits a scale wall; only the block family survives
   whole at the scale of UAD's multi-agent simulator.** Fused's wall was known (state count doubles per
   variable). The new finding: best-key/grown *intake* is fused-style too, and at 49
   variables it saturates outright — 19,999 distinct joint states in 20,000 samples,
   so "intake" reads as bias for every variable. **The no-core control caught it**
   (0% clean seeds — the collapse detector working exactly as designed), and the
   registration's locked interpretation rules converted it into a recorded
   infeasibility rather than a fake result.
5. **The attribution design worked.** SJ pre-registered: any colony failure re-runs
   partitioned (coupling=0) — persists ⇒ scale, vanishes ⇒ interference. Key-ring's
   shortfall (70%→90%) and the one systematic thief (agent 6's action wire, 6/20→2/20)
   both traced to **interference, not scale**.
6. **The witness-watch behaved.** Slow-meter world: the slowed goal found at 100% by
   every test; meter thefts under the keyed tests ≈0 (SJ's registered expectation
   holds); the block tests showed a concentration cost (the saturating meter stealing
   8–9/20) — a real comparative liability, on the record.

## Honesty trail (all dated in DECISIONS.md)

- **Two of our defects found and fixed mid-programme by the controls/investigation
  discipline:** (a) the deep-synergy world's two channels shared one action drive, so
  E1⊕E2 was quasi-frozen and the parity silently collapsed (our audit checked marginals
  only — it now checks joint dynamics); fixed with an exogenous weather channel and
  re-run. (b) The intake-saturation blind spot in the registered feasibility map, caught
  by no-core.
- **Two things users of UAD's older multi-agent simulator may care about:** its traces
  are only reproducible across processes with `PYTHONHASHSEED=0` (agents derive
  parameters via `hash(name)`; within-run results are unaffected — a question for its
  author, not a criticism: did cross-session reproducibility matter to any published
  comparison?), and our early runs needed a burn-in that UAD's own `generate_passive`
  applies but our harness initially didn't —
  `Steel1_goal`'s transitions all occur in the first ~55 settling steps.
- The v1-era slow-meter mechanism claim was retracted and replaced (near-frozen
  degeneracy, not slowness; the z=3 margin gate fixes it and was chosen deliberately
  low as a tripwire).

## The pruned programme (SJ's consolidation, 2026-08-12)

**fused-agents any-block** primary; **fused** as the small-world gold standard;
**grown keys** in reserve (graded-synergy sensitivity); **own-block** diagnostic; best-key and pairwise retired
with documented causes of death; one world configuration (lookalikes present — raw data
needs no pre-cleaning). v3 (designed 2026-08-12; colony-style worlds
only, the closest setting to UAD's multi-agent simulator) turns from "what works where" to the
curve-balls — can we *defeat* the instrument: two puppet-colonies (a captured goal,
wired into its agent's action but environment-driven — fast and slow variants, the slow
one registered as likely to defeat lag-1 passive tests), an alias-colony (goal twins at
noise {0, 0.5, 1, 2, 5}%, mapping the passive breaking point for the goal role), and
the handle benchmark's goal-flip operation generalised into a two-direction
**interventional yardstick**
("levers the world, unlevered by the world" — the signature's mirror under access),
reported as an access-premium table: best passive verdict | interventional verdict |
the gap. Roster: fused-agents any-block primary, own-block diagnostic. v4 (later):
systems-of-agents environments and the coalition-goals direction any-block opened.

## Reproduce

`v2_5_sweep.py --seeds 20 --jobs 4` (~12.5 h), `v2_5_anchor_fused_nulls.py`,
`v2_5_aggregate.py`; worlds audited in `results/v2_4/AUDIT_*.md` before any scoring;
verdict tables in `results/v2_5/V2_VERDICT.md`. 41 unit tests
(`value_detect/tests`), fixed seeds throughout.
