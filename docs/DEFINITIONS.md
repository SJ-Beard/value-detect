# DEFINITIONS — the governing glossary (locked 2026-08-12)

The single reference for every term this project has coined. **The category words
themselves are locked here first** (SJ: "test" had drifted). New coinages must be added
here at creation time; entries are alphabetical within each category. Status tags:
**ACTIVE** · **DIAGNOSTIC** (computed and reported, no pass/fail weight) · **RETIRED**
(kept in the record with its cause of death) · **V1-ERA** (historical).

## 0. The category words (the taxonomy itself)

- **WORLD** — a simulated environment that generates data (e.g. the colony). Worlds have
  ground truth (planted values) and ship with audits.
- **CONDITION** — a per-world variant run for control purposes: *main* (the world as
  designed), *no-core* (goals present but disconnected), *scramble* (columns
  independently time-shuffled).
- **TEST** — one complete scored analysis pipeline applied to a world, with its floors,
  evaluated against criteria. ("Test" never means a world, a condition, or a criterion.)
  Tests differ in *level* — variable-level (flows between individual variables) or
  block-level (the fused-agents family: detection first, then scoring against
  agent-blocks) — but this is a property of a test, not a category split (SJ,
  2026-08-12: all tests live in one section).
- **MEASURE / SCORE** — a number computed per variable (intake, drive, polarity…).
- **FLOOR / NULL** — the shuffled-data distribution a score must beat to count.
- **CRITERION** — a pre-registered pass/fail rule over scores and floors (V1, CV1, SM2…).
- **SIGNATURE** — *the* value signature: the criterion-defining construct (see §3).
- **DIAGNOSTIC / TRIPWIRE** — a standing reported column with no pass/fail weight,
  watched for trend breaks (witness-watch, parity gap…).

## 1. Worlds

- **alias-colony** — ACTIVE (V3). The colony plus causally inert goal twins
  (G{i}_alias = G{i} ⊕ noise) for two agents, appended post hoc; noise swept
  {0, 0.5, 1, 2, 5}%. Maps the passive breaking point for the goal role.
- **anchor** — ACTIVE. The V1 world: Gunnar's `SyntheticHandleWorld` as-is (9 variables,
  goal G flipping at 1.5%). The permanent regression baseline.
- **calibration world** — V1-ERA (V2-1 device). The anchor plus a slower true value, a
  slow moving meter (M_slow), and a near-frozen variable (F_frozen); used to choose the
  floor fix.
- **colony** — ACTIVE. Eight anchor-style agents (~49 variables), each with its own
  planted goal; weak ring coupling (each patch nudged by a neighbour's action ~10% of
  steps). **colony0** = the partitioned variant (coupling 0), run only as the registered
  attribution contingency.
- **deep-synergy world** — ACTIVE. Two isolated agents with two belief channels each
  (channel 1 action-driven; channel 2 exogenous "weather" — the 2026-08-12 fix that
  keeps the channels independent): agent P composes its action by parity, agent M by
  majority. Locates the synergy cliff.
- **goal_progress world** — V1-ERA (the C3 contrast). Gunnar's decoupled multi-agent
  simulator (1 solar + 1 steel), whose `goal_progress` columns are causally inert meters
  the instrument must refuse. Requires burn-in (2,000 steps) and `PYTHONHASHSEED=0`.
- **lookalike-free configuration** — RETIRED (2026-08-12). The as-is world with the
  perfect-copy columns dropped from analysis. Retired because the winning tests find
  goals with lookalikes present: raw data needs no pre-cleaning.
- **puppet-colonies A1/A2** — ACTIVE (V3). The colony with agent 3's goal-slot
  replaced by a *captured goal*: still wired into the action, but environment-driven.
  A1 fast (copies its patch ⊕3%; emergent ~22% tempo — the puppet partially
  XOR-cancels the belief and pacifies its own patch); A2 slow (flips only after its
  patch holds a value 6 consecutive steps; ~a true goal's tempo).
- **slow-meter world** — ACTIVE. The anchor with its goal slowed to 0.5% plus four
  causally inert meters at different timescales (M_fast, M8, M32, F_sat).

## 2. Tests

- **best-key** (full name: *fused + best-key*; variable-level) — RETIRED (2026-08-12).
  Fused intake; outbound takes the best reading over "no key" and each single decryption
  key. Causes of death: dominated by grown keys; intake saturates at colony scale;
  single keys cannot crack three-way parity.
- **fused** (*fused mega-state*; variable-level) — ACTIVE, small-world gold standard
  (≤ ~10 variables). Both directions measured against the fused joint state of
  everything else. Screens witnesses and cracks parity automatically; its state count
  doubles per variable (needs ~2M steps at 9 variables; infeasible beyond).
- **fused-agents any-block** (block-level; formerly "menu"; code id `menu`) — ACTIVE,
  PRIMARY. Every block (and singleton) offered as a potential key for every flow;
  target's past + one key element ≈ two-block conditioning, which decrypts three-way
  composition and needs no assumption about which agent owns the goal. 100% goal
  recovery in every V2 world. Structurally open to *system-of-agents* goals (SJ,
  2026-08-12).
- **fused-agents own-block** (block-level; formerly "key-ring"; code id `keyring`) —
  DIAGNOSTIC (2026-08-12). The candidate's own agent-block stands in the conditioning
  (outbound takes max of ring-on/ring-off). Scales fine; its weakness is
  detection-dependence — an orphaned goal has no ring, and detection tends to orphan
  goals. The any-block − own-block divergence measures partition quality.
- **grown keys** (variable-level) — RESERVE (SJ decides at V3 planning). Greedy
  key-growth (cap 2): the strongest reader of *graded* multi-input composition (+43%
  over best-key on majority rules); blind on flat parity plateaus (greedy cannot climb
  zero gradients).
- **pairwise** (variable-level) — RETIRED (V1). One-variable-at-a-time flows.
  Structurally blind to XOR-style composition (the cipher); with honest floors it
  cannot even establish the anchor goal's drive. The documented baseline of what naive
  measurement misses.

## 3. Measures and scores

- **drive / push-out** — what a variable's past adds about others' next step. *System
  flavour*: toward everything else (per the test's own definition). *Environment
  flavour*: toward the designated environment variable only (never conditioned through
  the action).
- **intake / push-in** — what everything else's past adds about the variable's next step.
- **net drive / net intake** — the score minus its own floor (95th percentile), clipped
  at zero. The signature's ratio clause runs on nets (bias-safe form).
- **parity gap** — DIAGNOSTIC. Block-family reading minus grown-keys reading per flow;
  large values flag parity-like composition.
- **polarity** — (drive − intake) / (drive + intake), in [−1, +1]: the fraction of a
  variable's traffic that is outbound. Only interpreted for rankable variables.
- **raw difference** — drive − intake in nats; always reported beside polarity.
- **total flow** — drive + intake; the rankability gate runs on it.
- **value signature** — THE criterion construct: (1) drive above floor (with z-margin),
  (2) rankable, (3) net drive > 0 and ≥ 9× net intake ("intake at floor" is the special
  case net intake = 0 — SJ's leak-tolerant clause in bias-safe form).

## 4. Floors and nulls

- **circular-shift null** — ACTIVE. The candidate's column rotated by random offsets
  against the fixed remainder; ≥200 shifts (25–50 pooled across seeds where registered).
- **pooling** — combining null samples across seeds for expensive tests (≥500–1000
  samples per score) before taking percentiles.
- **procedure-mirroring** — the rule that a null must run the *identical* scoring
  procedure as the real score (including key maximisation) so its bias is priced in.
  Corollary: deeper searches self-penalise (fatter honest floors).
- **rankable** — total flow above its floor (with z-margin). Polarity is meaningless
  below the floor.
- **transition surrogate** — RETIRED (V2-1). Null columns regenerated from the
  variable's own transition statistics; rejected by calibration (worse on the
  goal_progress control, better nowhere).
- **z-margin gate (z=3)** — ACTIVE. A score also must clear its null's mean by ≥3 null
  standard deviations. Kills hair-thin residuals of near-frozen variables; chosen over
  z=4 as the more diagnostic tripwire setting (SJ).

## 5. Pipeline components (block tests)

- **compression (top-64 macro-states)** — each block keeps its 63 most frequent joint
  states + one "other"; **lost mass** (the probability landing in "other") is a
  standing diagnostic.
- **environment bucket** — variables the detector assigns to no agent's cluster;
  **never fused** (SJ: agent-blocks respect a discovered coherence; the environment has
  none to respect). Members are ringless singleton elements.
- **orphans** — variables detection drops entirely; singleton elements, ringless.
  Goals are the classic orphans.
- **ring** — the candidate's own-agent block used as standing conditioning
  (fused-agents own-block only).
- **swept detection** — Gunnar's detector run at every dial (cluster count), the dial
  chosen by **viable coverage**: variables in blanket-valid blocks whose compression
  keeps ≥90% of mass; ties → more clusters (his E7/P1 selection philosophy + E12
  anti-lump precedent).

## 6. Criteria and controls

- **Thresholds** — ≥80% of 20 seeds (≥90% for goal-above-belief); "no systematic thief"
  = no non-goal variable holding the signature in >2/20 seeds.
- **Anchor criteria** — V1: goal has the signature; V2: uniquely; U1: goal above belief
  on polarity; U2: belief is the agent's max-intake member; T1 (best-key only, V1-ERA):
  goal's environment-flavour drive above floor.
- **Colony criteria** — CV1: every one of the eight goals signs; CV2: no systematic
  thief; CU1/CU2: per-agent analogues of U1/U2.
- **Deep-synergy criteria** — DS1: G_M for every test, G_P for block tests (the keyed
  tests' G_P rates are the measured cliff, not failures); DS2: no systematic thief.
- **Slow-meter criteria** — SM1: the slowed goal signs; SM2: no meter is a systematic
  thief.
- **no-core (C1-class)** — condition: goals exist but steer nothing; nothing may sign.
  The collapse detector (it caught the colony intake saturation).
- **scramble (C2-class)** — condition: every column independently shuffled. C2a: the
  count of above-floor scores sits in the 5% chance band (floor calibration); C2b: no
  signature at 99.5th-percentile floors.
- **goal_progress contrast (C3)** — V1-ERA control: the meter named "goal" must be
  refused. Its lessons (near-frozen degeneracy, transient contamination, witness class)
  produced the V2-1 floor standard.

## 7. The interventional yardstick (V3; calibration, never blended into the signature)

- **access premium** — the headline exhibit: per impostor, best passive verdict vs
  yardstick verdict; the gap is what interventional access buys.
- **autonomy probe** — does flipping the candidate's own patch change the candidate
  within 6 steps? (Flag→change CMI given the candidate's state; permutation floors.)
- **captured goal / puppet** — an impostor wired into the action like a goal but
  environment-driven in its own update. Levers the world AND is levered: refused by the
  yardstick via the autonomy probe; the passive signature must refuse it via intake
  (the slow variant is registered as likely to defeat lag-1 passive tests).
- **do-style flip** — the operation: on ~50% interleaved steps, the candidate's value
  AS CONSUMED by the dynamics is inverted (generalises Gunnar's embedded handle ops to
  every variable; recordings are consumed by nothing, so flipping them does nothing).
- **goal-role probe** — does flipping the candidate change its agent's behaviour, GIVEN
  the agent's policy context? (Context conditioning is required — the flag XORs into
  the action alongside belief-and-goal and is cipher-masked marginally; mirrors
  Gunnar's own interventional score.)
- **interventional mirror / interventional verdict** — role-effect above floor AND
  autonomy-effect at floor: "levers the world, unlevered by the world" — the value
  signature restated under access. True goal: yes/no. Captured puppet: yes/yes.
  Alias: no/–.
- **validation bench** — the anchor-world agreement check: Gunnar's embedded goal_flip
  (his machinery) and our do-style flip must yield the same verdict pattern before
  do-style is trusted in colonies.
- **zones (alias sweep)** — *indistinguishable* (goal and twin both sign — provably
  unavoidable at noise 0), *deadlock* (mutual screening; both refused), *separation*
  (goal signs, twin refused). The zone map vs noise is the breaking-point curve.

## 8. Phenomena and failure classes (the vocabulary of "how it fails")

- **cipher / encryption** — XOR-style composition hides each input from measures that
  condition on too little; a "key" (co-input) decrypts.
- **cliff (synergy cliff)** — where a test's decryption order runs out: single keys fail
  three-way parity; measured empirically in the deep-synergy world (best-key 0%, grown
  45%, menu 100%).
- **meter** — a causally inert integrator/summary of history; reads as drive-without-
  intake to under-conditioned tests (the witness class writ slow).
- **near-frozen degeneracy** — a variable with a handful of transitions: every score
  sits at its own unstable floor; the z-gate exists for this.
- **plateau** — zero single-key gradients in pure parity; greedy growth cannot climb it.
- **saturation (scale wall)** — a joint state-space too large for the sample (e.g.
  19,999 unique states in 20,000 steps): the estimate is bias, not measurement. Fused
  hits it beyond ~10 variables; best-key/grown hit it on the intake side at colony scale.
- **screening** — conditioning that removes real flow: mediators (the action screens the
  goal's path) and duplicates (a perfect log screens its readout). Max-based rules avoid
  it; joint conditioning exploits it deliberately for witness rejection.
- **twin-channel** — a derived recording is causally driven by its source, so a goal
  stripped of behavioural wiring STILL drives its twin: "drives without being driven"
  holds through the record (discovered in the V3 alias no-core; the instrument was
  correct and the control expectation mis-specified). Also a probe of value
  persistence through records (V4 direction).
- **transient contamination** — apparent structure from a simulator's settling-in
  period; the reason for burn-ins.
- **witness (shared-history confound)** — a variable that predicts others because it
  *records* what drove them (memories, meters, distractors). Real Granger-flow, zero
  causation; screened only by conditioning rich enough to carry the shared history.
- **witness-watch** — DIAGNOSTIC/tripwire: per-world meter/witness theft rates at z=3.
  SJ's registered expectation: ≈0 and declining with world complexity; an increase
  means stop and investigate.
