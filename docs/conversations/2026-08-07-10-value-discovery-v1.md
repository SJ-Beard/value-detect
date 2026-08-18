# Value discovery v1 — design lock through verdict (2026-08-07 → 2026-08-10)

*Session summary in the [agency-detect](https://github.com/GunnarZarncke/agency-detect)
house format (its `docs/conversations/` template): a compact record of the decisions
taken in one stretch of work and the reasons for them — not a transcript.*

## Initial problem

Turn SJ's theoretical claim — values are the parts of a system that drive without being
driven — into a runnable, pre-registered instrument test on Gunnar's handle-world,
communicating every step in plain English and touching nothing in his repository.

## Key decisions

- v1 world = `SyntheticHandleWorld` as-is, passive only; independent origin is the
  blindness substitute (soft-blind protocol conceded openly).
- Estimators reimplemented to his conventions (α = 0.1 plug-in CMI, nats) with
  provable-answer unit tests before anything downstream (25 tests).
- Options memo → SJ picks: pairwise Rest + mega-state cross-check; polarity primary;
  boundary sanity check included.
- The cross-check disagreed with pairwise on the action's intake → diagnosed as XOR
  **cipher** blindness (readings match hand-derivation). SJ's standing rule adopted:
  **when two requested measures disagree, investigate and explain; never wave through.**
- No "repair": conventions multiplied into co-equal tests (SJ) — final grid
  {as-is, alias-free} × {pairwise, fused mega-state, fused + best-key}.
- Success criteria locked pre-sweep around the **value signature** (drive above floor,
  rankable, net intake at floor or net drive ≥ 9× net intake — SJ's leak-tolerant
  clause) + uniqueness + controls; two pre-sweep calibration amendments documented
  (scramble multiple-comparisons; floor-adjusted ratio).
- Pairwise's expected uniqueness failure pre-registered rather than patched (SJ:
  documenting why it fails beats saving it on a technicality).

## Experiment progression

- **Chunk 2** wrap + verify world: mechanism table matches designed noise to <1%; G
  flips 1.3% of steps.
- **Chunk 3** estimator core: analytic targets hit (copy = ln 2; mediation screening;
  Marko–Massey conservation exact on analytic cases).
- **Chunk 4** first scored runs: cipher diagnosis; fused convention shows G alone in the
  drive half (screening property, predicted in log before running); Gunnar's
  `AgentDetector` finds the body (leakage 0.001) but drops G as an MI-invisible
  singleton.
- **Chunk 5** locked sweep (20 seeds, 80 units, 37 min + pooled fused floors): verdict
  in E21 entry — fused and fused+best-key pass everything on the main world; pairwise
  fails structurally (wires 20/20); `goal_progress` control exposes best-key's slow-meter
  blind spot (30% steal rate) [corrected 2026-08-18: near-frozen-variable degeneracy,
  not slowness — see the corrected control bullet in `WRITEUP_V1.md`].

## Current state

Instrument test: **success under the locked criteria** for the two synergy-aware
conventions; theory untouched by the failures (all "soft" — this world passes, bigger
worlds wouldn't). Verdict, heatmap, and short Gunnar-facing write-up shipped
(`docs/WRITEUP_V1.md`, `docs/ELOG_E21.md`).

## Follow-up ideas

- **Fused agents + fused environment** (SJ): detect agents first, fuse within each +
  environment bucket → #agents+1 elements; re-run this benchmark; scales toward the
  50-variable multi-agent world.
- Block-preserving nulls for slow/cumulative variables (the C3 fix candidate)
  [superseded in v2 by z = 3 margin gates plus a 2,000-step burn-in].
- G_alias breaking-point variant (bridge to the access-model paper); hidden-G; graded
  (non-parity) decision rules to locate the best-key cliff empirically; emergence of
  polarisation in evolved systems (the real v2 question).
