# V2 plan — new tests, same discipline (signed off 2026-08-10)

**Progress:** V2-1 CLOSED 2026-08-11 (z=3 margin gates + roll nulls + harness hygiene).
V2-2 CLOSED 2026-08-11: grown keys qualified — 100% on all main criteria AND C3 (the
expected-fail prediction falsified; floors self-penalise search depth — see DECISIONS).
V2-3 in progress (fused-agents + fused-environment).

**Scope (SJ):** fix the nulls; qualify two new tests (grown keys; fused-agents +
fused-environment) in the V1 world against the same criteria; if they pass, run them
alongside V1's two winners (fused; fused + best-key) in three new worlds. **Deferred to
V3:** goal-flip interventional yardstick, puppet variant, G_alias — the curve-ball
experiments. Working style unchanged: small chunks, plain-English summaries, SJ sign-off
at every gate, options memos wherever a real design choice exists, everything
pre-registered before it is scored, `agency-detect-master/` untouched.

---

## Chunk V2-1 — Fix the noise floors

**Step 0, before building anything: verify the C3 failure mechanism.** The slow-meter
story (autocorrelation-inflated floors zeroing net intake) was a plausible inference,
not a verified fact. The chunk-5 JSONs already contain every failing seed's scores and
floors; first deliverable is a short memo reading them: in the 6/20 seeds where
`goal_progress` stole the signature under best-key, which branch actually fired — net
intake collapsing to zero, or witness-drive clearing its floor, or both? The null
redesign is chosen against the verified mechanism, not the story.

**New implementation:**
- A second null family alongside circular shifts. Candidate designs (options memo → SJ
  picks, informed by Step 0): **block permutation** (shuffle large contiguous blocks —
  preserves local dynamics, breaks long-range alignment), **transition surrogates**
  (regenerate the candidate column from its own fitted transition statistics —
  preserves its dynamics exactly, independent of everything else), or both.
- Level-1 calibration tests, analytic before real: on scrambled data the false-positive
  rate must sit at ≈5%; on a purpose-built tiny world containing a *slow genuine value*
  and a *slow meter*, the new null must accept the first and reject the second — that
  discriminating pair is the acceptance test for the whole chunk.
- Re-run the V1 chunk-5 evaluation (all six tests + C3) under the new nulls, alongside
  the old, and report every verdict that flips. Variables whose verdicts flip between
  null families are flagged as autocorrelation-sensitive — itself a useful diagnostic
  column for all later worlds.

**Gate:** C3 passes honestly under the new nulls without breaking any V1 pass; SJ signs
off on the flip-report.

## Chunk V2-2 — Grown keys, qualified in the V1 world

**New implementation:**
- A fourth convention: greedy key-growth per directed flow — start keyless, repeatedly
  add the single conditioning variable that most raises the reading, stop by a
  pre-registered rule. **The stopping rule is the one real design decision** (fixed cap;
  improvement threshold; bias-priced threshold) — short options memo → SJ picks before
  first scoring.
- Floors that mirror the full greedy procedure (the engine already guarantees
  mirror-exactness by construction; extend it).
- Unit tests with provable answers: on the chain it must agree with pairwise; on the
  two-input XOR loop it must find one key (matching best-key); on a **three-input XOR
  loop** (the two-beliefs preview) it must find two keys and read the true value where
  best-key reads nothing — the test that justifies the convention's existence.

**Run:** seed-0 grid, then the full locked V1 evaluation (20 seeds, new nulls, same
thresholds, T1 included — grown keys has an environment flavour).
**Gate:** passes everything the V1 winners passed, including controls and C3.

## Chunk V2-3 — Fused-agents + fused-environment, qualified in the V1 world

**New implementation:**
- **Front-end:** Gunnar's detection machinery proposes agent memberships from the trace.
  Known wrinkle from V1: his clustering drops G as an invisible singleton — so the
  scheme must handle orphans. Proposed rule (to confirm with SJ): candidate variable X is
  scored against elements = fused block of each detected agent (minus X), a fused
  environment bucket, and each orphan as its own element — so a dropped goal remains
  scoreable rather than vanishing.
- **The honest complication to solve here:** fusing reduces the *number* of elements,
  not each block's *state count* (seven binary variables fused still have up to 128
  states; Gunnar-scale agents with multi-valued variables far more). The scheme
  therefore needs a **within-block compression step** (macro-states per agent — e.g.
  frequency-based state binning to a fixed budget). Compression method = options memo →
  SJ picks. This is the piece that makes the idea scale, and the piece that most needs
  care.
- Floors mirroring the whole pipeline (detection + fusion + compression + scoring), and
  unit tests: on the V1 world it should reproduce the fused convention's verdicts; on a
  two-agent toy it must keep each agent's value separable.

**Run and gate:** as V2-2. Optional cheap add-on (decide at the gate): a
**structure-blind twin** — same cardinality budget, no agent detection — to show the
agent structure is doing the work.

## Chunk V2-4 — Three new worlds (ours, built to be audited)

All in our own package, modelled on the handle-world's equations; each world ships with
its Chunk-2-style audit *before anything is scored*: story printout, change-frequency
chart, mechanism-agreement table, and a pre-registered per-variable prediction table.

1. **Colony world (Gunnar-scale multi-agent):** N ≈ 8 handle-world-style loops (~50
   variables), each agent with its own planted value-core; shared or partitioned
   environments as a design choice (options memo). Ground truth: every agent's G — and
   nothing else — carries the signature *within its agent's context*. This is also where
   the fused convention's "cannot run at scale" becomes a recorded result rather than a
   footnote.
2. **Deep-synergy world:** two sensors → two beliefs per agent; action = both beliefs
   combined with the goal (three-input composition). Pre-registered expectations:
   best-key fails to see the goal's drive here (its documented order-2 limit); grown
   keys and both fusion tests see it. This world exists to separate the new tests from
   the old on the exact axis SJ identified.
3. **Slow-meter-rich world:** the V1 loop plus several integrator/meter variables at
   different timescales *and* a slower genuine value (lower flip rate). The
   discriminating pair from V2-1 at full scale: accept the slow value, reject every
   meter. This is the world the new nulls must survive.

**Gate:** SJ audits each world's story printout and prediction table before any scoring
— exactly as in V1 Chunk 2.

## Chunk V2-5 — The V2 experiment

- **Pre-registration:** adapt the signature criteria per world (per-agent signatures in
  the colony; per-world uniqueness sets), fix seeds/thresholds/floor settings (new
  nulls), and the feasibility map (which tests run in which worlds; infeasible = a
  recorded outcome, not a blank). Locked with SJ before the sweep, as in V1.
- **The sweep:** four tests (fused, fused + best-key, grown keys, fused-agents) × four
  worlds (V1 anchor + three new) × controls per world (no-core analogues, scrambles;
  `goal_progress` contrast re-run under new nulls). Compute budgeted per chunk and
  reported before launch; parallel, resumable, background — the V1 machinery generalises.
- **Write-up:** verdict tables, the V2 heatmap (tests × worlds), a short memo for
  Gunnar, and a drop-in **E22** entry. The headline question V2 answers: *which
  measurement philosophies survive outside the world they were born in?*

## Not in V2 (fenced, on the record)

Goal-flip interventional yardstick, puppet variant, G_alias (all V3: adversarial
defeat-the-instrument experiments); multi-horizon scoring (revisit if any V2 test shows
timing fragility); emergence-of-polarisation (the v3+ question the instrument line is
building toward).
