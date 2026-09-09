# Decisions log — Unsupervised Value Discovery

Durable record of decisions taken with SJ during the build. Plain English.
Newest at the bottom. This is *our* file at the project root; Gunnar's repo is untouched.

*Reading note.* Text in square brackets `[…]` is an editorial insertion added on
2026-08-18, not part of the dated entry it sits in. The early entries cite "the design
document" and "the addendum" — the two v1 planning files that were retired from this
repository (see the closing entry). Wherever an entry refers to one of them, the bracket
reproduces the passage being referred to, so the record stays exactly as written while
remaining readable without those files.

---

## 2026-08-07 — Success criteria (provisional)

**Context.** SJ asked whether the design document's suggested success numbers
("G tops the asymmetry ranking in ≥ 80% of ≥ 20 seeds; G above B in ≥ 90%") match the
level of significance Gunnar used in his UAD experiments. [The design document's §6 had
offered these as "working figures — finalise numbers with SJ before the first full run,
and do not adjust after", alongside two more: "B tops the intake ranking among the true
loop variables in a comparable majority" and "the no-core control shows no variable
above the noise floor on asymmetry in ≥ 80% of seeds"; plus a stability clause: "the
headline ordering holds across run lengths {2k, 5k, 20k} and analysis lags {1, 2, 3};
the stability map is reported either way".]

**Finding (from reading Gunnar's `docs/EXPERIMENTS.md`, E0–E13).** No — Gunnar does not use
an "X% of N seeds" success threshold anywhere. His rigour comes from three habits instead:
(1) comparing every score to a **chance level or null/noise floor**, not to a fixed absolute
number; (2) **multi-seed sweeps and breaking-point curves** that report where a result holds
and where it collapses; (3) point metrics (recall, ARI, Jaccard) often on a **single seed**,
with his most seed-heavy work using ~5 seeds per condition. So 20 seeds is already more
conservative than his norm, and the 80/90 numbers are a fresh pre-registration for *this*
project, not inherited from him.

**Decision.** Adopt the 80% / 90% figures **provisionally** as working targets. The real
claim of significance rests on the **noise-floor separation and the controls**, mirroring
Gunnar's floor-not-threshold habit — not on the exact percentages.

**To finalise before the first full Chunk 5 (scored) run, and not to change afterward:**
- the seed count (20 provisional; may revise up or down once Chunk 4 shows how clean/variable results are);
- the percentages (80 / 90 provisional);
- **most important:** how far above its own noise floor a score must sit to "count" — calibratable only once Chunk 5 produces the floors.

**Status.** Provisional; final lock happens just before the first scored sweep. SJ will watch
for evidence during the build that helps set these well.

---

## 2026-08-07 — How we import Gunnar's packages (deviation from the plan, flagged)

**Plan said:** install Gunnar's packages in editable mode (design §7) [the design
document's technical specification: "Install his packages from the subfolder in editable
mode (at minimum `uad_handles` for the world, plus `agency_detect` for estimator
reference) rather than copying code."].

**What actually happened:** his `uad_handles/pyproject.toml` declares its licence as the file
`../LICENSE.md`, which sits *outside* the package folder. Modern setuptools refuses to build a
package that reads a file outside its own directory, so `pip install -e` fails. His repo is
**read-only**, so fixing his file is not allowed.

**Decision (per the design's own "trust the repo, flag the discrepancy" rule):** [the
design document's opening instruction: "If this document and Gunnar's repository disagree
(paths, experiment numbering, code behaviour), trust the repository and flag the
discrepancy to SJ."] import his packages **in place** instead of building them — a `.pth`
path file in our virtualenv adds his `uad_handles/src` and `agency_detect/src` (and our
`value_detect/src`) to Python's import path.
This has the same effect as an editable install — his code is imported, never copied or modified —
and avoids his packaging bug. No change to any file inside `agency-detect-master/`.

**Environment location:** the virtualenv lives at `~/.venvs/value-detect`, **outside** iCloud, so
thousands of package files do not sync. One command regenerates Chunk 2 artifacts (see value_detect/README).

---

## 2026-08-07 — Chunk 4 design choices (locked before any scored run)

Chosen by SJ from the options memo (`docs/CHUNK4_OPTIONS_MEMO.md`), blind to all results:

1. **"Everything else" = pairwise sum, plus one fused-mega-state cross-check at 20k steps.**
   Hand-picked conditioning sets rejected (knob-turning risk). The environment-flavour
   push-out never conditions on the action (mediation; demonstrated in Chunk 3).
2. **Primary ranking statistic = polarity** (drive−intake divided by drive+intake, −1..+1),
   with the raw difference always reported alongside. Chunk 5 noise floors gate who is
   rankable. The pre-registered criteria are read with "asymmetry ranking" = polarity ranking.
3. **Boundary-discovery sanity check: INCLUDED** (SJ chose against the memo's skip
   recommendation): run Gunnar's own clustering/blanket machinery on the trace to confirm
   the known agent boundary emerges, as a side artifact of Chunk 4.

Item 4 (sharpened alias predictions) went to discussion rather than immediate sign-off;
resolved same day, below.

---

## 2026-08-07 — Item 4 resolved: no alias pre-commitment; run both configurations

**SJ's reasoning (adopted):** v1 is an instrument test, not a theory test. The noiseless
lookalikes are a quirk of this world; other target systems may have nothing like them. So
rather than pre-committing to a sharpened alias prediction, run the instrument **both ways**
and report what we see — more information, no risk of being led astray, and evidence about
the tool's wider applicability if it finds the goal in both.

**Decided:**
- The design document's original §4 prediction table stands **unchanged** (soft wording:
  "A_alias may show apparent drive") [the table, reproduced from the design document's §4
  ("The nine observed binary variables", observation vector order: B, S, A, E, G, S_alias,
  A_alias, D, W):

  | Variable | Plain-English role | What drives it | What it drives | Predicted map position |
  |---|---|---|---|---|
  | **G** (goal) | Planted **value-core** | Nothing — flips by its own internal coin, ~1.5% of steps (`goal_flip_rate = 0.015`) | The action (A combines B and G) | **High drive, near-zero intake** — the headline prediction |
  | **B** (belief) | Planted **belief pole** | The sensor line (tracks the environment, with noise) | The action | **High intake**, moderate drive |
  | **A** (action) | Decision output, noisy readout | B and G jointly, plus noise | The environment (E flips with the action line) | High drive *and* high intake — the mediator |
  | **E** (environment) | The world state | The action line, plus its own noise | The sensor line | Driven and driving — mid-map |
  | **S** (sensor) | Noisy readout of the sensor line | The environment | The belief | High intake |
  | **S_alias** | Passive lookalike of the sensor line | Same line, different noise | Nothing (causally inert log) | High intake, like S |
  | **A_alias** | Passive lookalike of the action line | Same line, different noise | Nothing (causally inert log) | **May show apparent drive** — expected, honest limitation; see §5 |
  | **D** (distractor) | Environment-correlated decoy | The environment | Nothing | Pure intake |
  | **W** (noise) | Pure noise | Nothing | Nothing | Near the origin |

  The table's "see §5" pointed to the design document's discussion of Gunnar's
  access-model ("handles") paper: lookalike variables can fool any passive method, so
  A_alias's expected apparent drive was framed as marking the boundary of what passive
  methods can do, not as an embarrassment.] No pass/fail criterion attaches to the
  lookalikes.
- Chunk 4 runs **two configurations** of every scored analysis:
  (a) world as-is (nine variables, lookalikes included);
  (b) lookalike-free (the same recorded traces with the S_alias / A_alias columns dropped
  from the analysis — equivalent to a world that never recorded the perfect logs, since the
  recorded alias columns are causally inert; Gunnar's files untouched).
  A noisy-lookalike variant remains an optional extra for later.
- **Dated note, not a criterion** (mechanics-derived expectation, recorded for honesty):
  because `alias_noise = 0` and the dynamics reuse the alias columns as the effective
  drivers, any correct passive measure should read A_alias ≥ A on drive and S_alias ≥ S on
  intake in configuration (a). If the data contradicts this, the instrument (not the world)
  is suspect. This note carries no success/failure weight.

**Unchanged by this resolution:** the G-vs-B headline criteria, the pre-committed controls,
and the locked Chunk 4 design choices (pairwise Rest + 20k mega-state cross-check; polarity
primary with raw alongside; boundary sanity check included).

---

## 2026-08-10 — Cipher-blindness diagnosis; TWO conventions run in parallel (SJ)

**What happened.** SJ challenged the Chunk 4 reading that the action's intake was tiny
(0.005 nats) when the action is by construction determined by belief-and-goal. Diagnosis
(`results/chunk4/DIAGNOSIS.md`, all readings matching hand-predicted values):

- The world's XOR combinations act as ciphers: each input to an XOR is invisible to
  **pairwise** (one-variable-at-a-time) measures unless the other input (the "key") is
  known. The action's true intake is ~0.30 nats, visible only jointly.
- Re-timing the world (a lagged decision) does **not** fix it — tested in a variant
  simulation; the XOR does the hiding, not the tick structure. Gunnar's world stays as-is.
- One extra conditioning variable ("decryption key") reveals hidden outbound flows at
  hand-predicted size (goal→environment: 0.000 naive → 0.441 decrypted); conditioning on a
  mediator wrongly kills flows (as the design warned) [the design document's mediation
  warning: "do not condition on mediators when computing the environment flavour — G
  reaches E *through* A, and conditioning on A would screen off exactly the influence
  being measured"]; decoy witness-flows stay dead.
- The mega-state cross-check had already flagged this (0.31 vs 0.005) and Claude initially
  waved the disagreement through — process failure, corrected. **Standing rule from SJ:
  when two requested measures disagree, investigate and explain; never wave through.**

**Decision (SJ).** No "repair"/replacement of the primary. Instead, **two instrument
conventions run in parallel as co-equal tests**, mirroring the two world configurations:

- **Convention 1 — pairwise:** as locked on 2026-08-07 (pairwise sums both directions).
- **Convention 2 — cipher-aware:** intake = joint (mega-state) conditioning; outbound =
  best reading over "no key" and each single decryption key (same automatic rule for every
  variable; no hand-picking).

Chunk 4 reruns as a **2×2**: {world as-is, lookalike-free} × {pairwise, second convention},
**all four results reported equally**. No primary convention is chosen for now — future
multi-agent worlds may behave differently and the conventions' divergences are themselves
findings about how the tool works. Polarity remains the within-convention ranking statistic
(raw difference alongside), unchanged. Chunk 5 floors must mirror each convention's own
procedure (including the best-key maximization, which inflates small-sample bias).

**Naming correction (same day, SJ).** The second convention was briefly labelled
"cipher-aware", which wrongly implied the whole test was designed in response to the
encryption discovery. Provenance, for the record:

- Its **intake** half is the **fused mega-state** test — the original Option-A cross-check
  from the options memo, unchanged (identical numbers to the Chunk-4 cross-check column),
  chosen *before* the cipher diagnosis. It is the measure that caught the discrepancy.
- Its **outbound** half, **best-key**, is genuinely new — designed during the diagnosis,
  because the fused version of outbound needs far more data than our runs contain.

The convention is therefore named **"fused + best-key"** everywhere (code, tables, figures).
"Cipher"/"encryption" remains the name of the *phenomenon* only.

---

## 2026-08-10 — SIX co-equal tests: add the full fused mega-state convention (SJ)

**SJ's reasoning:** fused + best-key feels closer to hand-tailored for this environment;
more general tests, if they find the result, generalize better. Keep the fused mega-state
in the mix. → The grid becomes {as-is, lookalike-free} × {pairwise, fused mega-state,
fused + best-key}: **six analyses, all reported equally.**

---

## 2026-08-10 — Chunk 5 executed; FINAL verdict (results/chunk5/CRITERIA_VERDICT_FINAL.md)

Sweep ran as locked (20 seeds; 80 units, 37 min; pooled fused floors added in a
spec-compliance pass after the per-seed implementation was caught deviating — samples
regenerated deterministically, no re-measurement of scores).

- **Fused: passes every criterion and every control** (V1 100%, V2 95/100%, U1 100%,
  U2 100%; C1/C2 all pass). **Fused + best-key: passes all main criteria** (incl. T1
  100%) and all main-world controls.
- **Pairwise: fails V1/V2/U1 (5%/0%/5%)** — wires held the signature 20/20 as
  pre-registered, and with floors in place G's pairwise signal is indistinguishable from
  nothing. Its own controls pass (the machinery is calibrated; the convention is blind).
  The documented case for dropping pairwise is complete.
- **C3 under best-key: FAIL (70%)** — genuine limitation discovered: slow cumulative
  meters (`goal_progress`) have autocorrelation-inflated floors → net intake zeroes out
  while witness-drive clears its floor → signature in ~30% of seeds. Pairwise C3: 100%
  pass. Remedies for later: autocorrelation-preserving nulls (block shifts); agent-level
  fusion. Reported as a pre-registered FAIL, no post-hoc patching.
- W's 1/20 blips ≈ the expected 5% chance rate; scramble calibration ≈ nominal.
- Stability: fused +0.998 across lags 1–3; best-key graceful (+0.78 at lag 3, +0.98 at
  2k steps); pairwise unstable (±0.4).

**Per the locked interpretation rules the instrument test is a SUCCESS** (V1/V2 hold in
fused and fused + best-key; convention failures are mechanism-documented findings).

---

## 2026-08-10 — SJ's project conclusion (recorded in the write-up, endorsed by Claude)

The experiment shows the **theoretical possibility** of detecting goals directionally,
but **none of the tests as built is good enough to carry future experiments alone**:
*(V2 scope decided same day — see entry below and `docs/V2_PLAN.md`.)*
fused cannot scale to multi-agent worlds (~50 variables impossible); fused + best-key
fails >2-input compositions (two-beliefs example; sharpest for parity-like rules —
graded rules leak more, cliff location an empirical question) and has the slow-meter
blind spot (C3). These are **soft failures** — this experiment's conditions pass, the
theory stands — but they predict failure in the experiments we want next. **Next step:
develop at least one more test, starting with SJ's "fused agents + fused environment",
and repeat this benchmark with it.** Chunk 6 shipped as a short Gunnar-facing memo
(SJ–Gunnar meeting this week): `docs/WRITEUP_V1.md` + `docs/ELOG_E21.md` [since renamed `ELOG_V1.md`: the v1
entry was never inserted into Gunnar's log, and the number E21 went to the v3 entry
instead — see the 2026-08-18 renumbering entry] (E21 verified as the next free number)
+ session summary + figures.

---

## 2026-08-10 — V2 scope (SJ; plan in `docs/V2_PLAN.md`, pending sign-off)

Order: (1) fix the nulls — starting by *verifying* the C3 mechanism from stored chunk-5
data before designing the fix (the slow-meter story was inference, not yet fact);
(2) qualify **grown keys** and **fused-agents + fused-environment** in the V1 world
against the same locked criteria (new nulls); (3) if they pass, run them alongside V1's
two winners in three new worlds: **colony world at Gunnar's scale (~8 agents, planted
value-cores)**, **deep-synergy world (two sensors → two beliefs + goal per action)**,
**slow-meter-rich world (meters at several timescales + a slower genuine value)**.

**Deferred to V3 (SJ):** goal-flip interventional yardstick, puppet variant, G_alias —
"not what works in what environments, but whether we can throw curve balls to defeat
our method." Multi-horizon scoring parked unless V2 shows timing fragility.

Bundle `value-detect-v1-master/` (13 MB, verified: bundle-local imports, 25 tests, live
script run) shipped for Gunnar the same day.

---

## 2026-08-10 — V2-1 Step 0 verdict: v1's C3 mechanism claim RETRACTED; fix chosen (SJ)

Reading the stored chunk-5 records (`results/v2_1/C3_MECHANISM.md`): all six signature
thefts were **Branch B** (net intake > 0 — the "floor swallows intake" story never
occurred), all six were `Steel1_goal`, whose change rate is ≈ 0.000: a **near-frozen**
variable whose every score sits at its own floor, with gates firing on hair-thin noise
residuals (effective sample = its handful of transitions). The genuinely slow meter
`Solar1_goal` (~1.1% change rate) was correctly rejected 20/20 under both conventions —
slowness was never the problem; **frozen-ness is the degenerate case**. v1's phrase
"best-key's blind spot is slow meters" is imprecise; correction lives here and in the V2
docs. **SJ chose to leave the shipped v1 write-up and bundle unchanged** (historical
document).

**Fix (SJ): Option 3 — both, decided by calibration.** (1) z-margin gates: a score
counts as above floor only if it also clears the null mean by ≥ z_min null-sd (z_min
swept in calibration, then pre-registered in V2-5); (2) transition-surrogate nulls built
as a comparison family. Acceptance: slow-true-value signs; moving meter and near-frozen
variable never sign; scramble false-positive rate ≈ nominal; C3 re-run passes; no V1
main-world pass flips to fail.

---

## 2026-08-10 — V2-1 calibration round 1: two further verified root causes in C3

Calibration suite results: z-gates fix the calibration world outright (slow value signs
100%, meters/frozen steal 0% at z ≥ 3, no V1 flips at any z ≤ 5) — but C3-best-key
stalled at 75%, and the "z=5 theft set" was not a subset of the "no-z set", which is
logically impossible for an added AND-condition. Investigation found two real causes:

1. **Initial-transient contamination (harness bug, ours).** Every `Steel1_goal`
   transition in every inspected seed occurs in the first ~55 steps (the simulator's
   settling period); the variable then freezes for the remaining ~19,945. Its measured
   "drive" is transient co-drift. Our C3 harness applied **no burn-in**, violating the
   addendum's stationary-post-burn-in rule [the addendum's rule, verbatim: "all
   quantities on the stationary post-burn-in trace, in nats"]. Fix: trim the first
   2,000 steps (generate 22k, analyse the last 20k).
2. **Gunnar's simulator is not reproducible across processes** (`agents.py` derives
   per-agent parameters from `hash(name)`; Python string hashing is per-process
   randomized). Same seed → different traces in different processes; the suite's C3
   floors therefore belonged to different worlds than the stored scores (240 p95
   mismatches — the round-1 C3 evaluation is void). Verified: pinning
   `PYTHONHASHSEED=0` makes traces bit-identical. Fix: pin it in every script touching
   `agency_detect.agents`; worth flagging to Gunnar. V1's C3 results remain *internally*
   valid (scores and floors shared a process) but are not bit-regenerable; recorded as a
   caveat, not a retraction.

C3 rerun with both fixes (hash pinned, burn-in, scores+floors co-computed) decides the
final configuration alongside the round-1 calibration-world and V1-regression results.

---

## 2026-08-11 — V2-1 GATE CLOSED (SJ): z=3; floors fixed; residual attributed to best-key

**C3 rerun outcome:** burn-in cured the frozen-variable thefts entirely (`Steel1_goal`:
zero). A new residual appeared under best-key only: `Solar1_goal` (the *moving* meter)
in 6/20 seeds, unaffected by z up to 5 — verified as **real Granger-flow with zero
causation** (nothing in `agents.py` reads `goal_progress`; its credit arrives in small
parcels from its own agent's memories/sensor/energy — shared-action-history witnessing
that no single conditioning key can screen). Not a floor problem; structural to
max-based single-key conditioning. Transition-surrogate family: rejected by calibration
(worse on C3, better nowhere).

**Adopted (SJ):** circular-shift nulls + **z = 3** margin gates + harness hygiene
(2,000-step burn-in on Gunnar's simulator; `PYTHONHASHSEED=0`). SJ chose z=3 over the
recommended z=4 on minimal-deviation and **diagnostic-tripwire** grounds: a low gate
keeps witness-class recurrences visible in future worlds. **Pre-registered expectation
(SJ): meter/witness interference should DECLINE as worlds grow richer; if it instead
grows, that flags a deeper conceptual issue — stop and investigate.** V2 experiments
carry a standing "witness-recurrence watch" column (per-world meter-theft rates at z=3).

**Acceptance rewording:** C3-best-key stands at 70% as that convention's
mechanism-attributed witness limitation; the C3 ≥ 80% requirement binds the V2-2 and
V2-3 gates (registered prediction: grown keys, also max-based, will FAIL it; the fused
family, which screens observed shared history jointly, will pass). Deviation scope note:
both harness fixes correct OUR pipeline; neither modifies Gunnar's code or design — the
reproducibility question goes to Gunnar as a question, not a claimed flaw.

---

## 2026-08-11 — V2-2: plateau discovery; grown keys reframed (SJ picked Option B)

The Level-1 justifying test failed before any scored run: **greedy growth cannot climb a
flat plateau** — in pure three-way parity every single key has zero marginal gain, so
stage-1 selection is bias noise (grown 0.001 ≈ best-key 0.001; only fused sees it,
0.519). On graded composition (majority rule) grown keys is the strongest reader in the
stable (0.308 vs best-key 0.215, fused 0.219). Decision (SJ): **Option B** — keep greedy
growth as the *graded-synergy specialist*: fixed cap k_max=2, max over stages, no
adaptive stopping; pre-registered expected failures = pure parity (unit-tested) and C3
(witness inheritance, by construction since grown ≥ best-key); the V2-4 deep-synergy
world becomes **dual** (one parity-composed agent + one majority-composed agent) so the
cliff's location is measured; standing **"parity gap" diagnostic** (fused minus grown
per flow) joins the z=3 witness watch as a tripwire. Qualification gate now runs: V1
world, 20 seeds, z=3 floors, full criteria; C3 expected-fail on record beforehand.

---

## 2026-08-11 — V2-2 GATE PASSED; the C3 expected-fail prediction FALSIFIED (good direction)

Grown keys (k_max=2, z=3 floors, 20 seeds): main world **100% on every criterion**
(V1/V2/U1/U2/T1; one 1/20 W blip in the lookalike-free config = the designed 5% rate);
controls clean (C1 100/100, C2a 80/90, C2b 100/100); **C3 passed 100%** — against the
pre-registered expected-fail. Mechanism verified with numbers (results/v2_2 vs v2_1):
the meter's raw reading doubles under the deeper search (0.065→0.145) but its
procedure-mirrored null floor more than doubles (0.042→0.144) — on null columns the
two-stage max harvests order-statistics freely; on the real meter it adds only tiny
genuine parcels. Net drive collapses (~0.025→~0.002), ratio dies, theft gone in 6/6
former theft seeds. **Lesson: procedure-mirroring floors self-penalise search depth;
witness limitations do NOT inherit by score-monotonicity because floors inherit faster.**
The "by construction" inheritance claim is retracted. Grown keys is QUALIFIED for the
V2 benchmark. (Best-key's C3 standing: unchanged — 70%, its own limitation.)

---

## 2026-08-11 — V2-3 design locked (SJ): TWO architectures in parallel; prune before V3

SJ's picks: detection = Gunnar's adaptive detector as-is; orphans = singleton elements
(the goal is exactly what clustering drops); compression = top-64 macro-states with
per-block lost-mass reported. Architecture: **both variants run as co-equal tests**
(the as-is/lookalike-free pattern): **key-ring** (own-agent block standing in the
conditioning) and **menu** (blocks as a best-key menu). Full block-level fusion dropped
as infeasible at scale — recorded, not built.

**Standing commitment (SJ): after V2 completes, revisit and PRUNE the option grid**
(architectures ×conventions ×worlds) before V3 begins — no combinatorial explosion.

**Detection front-end deviation (recorded, SJ veto available):** "adaptive as-is"
proved degenerate in practice — his adaptive starts at the config dial (8, tuned to his
own worlds), fragments small worlds, and stops at the first validating fragment (V1
world: one 2-variable "agent" {B, S_alias}, everything else dropped; his log captured as
evidence). Since every path embeds a start-dial choice, the pick's *intent* (his
machinery, no hand dial) is implemented as the **swept selector**: his plain detector at
every dial, the dial chosen by his own blanket-validity coverage (ties → fewer
clusters) — the selection philosophy of his own E7/P1 work. At 20k it reproduces the
canonical V1 partition (dial 2, 7-variable body, G orphaned). Chosen dial + coverage
reported per world as diagnostics.

**Implementation note (pre-implementation refinement, recorded rather than silent):**
a standing own-block ring would SCREEN a member-goal's environment drive through its own
in-block action (the V1 mediation trap). Outbound flows therefore take the max of
ring-on and ring-off per target (mediation-safe, mirroring best-key's max philosophy);
intake keeps the standing ring (screening redundant intake is the desired fused-style
behaviour). Own-block-as-target stays measured (a goal's grip on its own agent's action
is outbound to its own block's future). Orphans have no ring (reduces to block-level
conditioning against the other elements — which is exactly what cracked the V1 world).

---

## 2026-08-11 — V2-3 GATE PASSED: both architectures qualified

Keyring and menu, z=3 floors, 20 seeds: V1 100/100, **V2 100/100 with zero violators**
(no W blips — block context absorbs them), U1 100/100, U2 85/100 (both pass; keyring's
3 misses = seeds where detection placed G inside the body block — V1/V2 stayed 100%
there: the ring then decrypts the cipher itself), C1/C2 clean, **C3 100/100** (the
structural witness screen confirmed — the registered expectation). Compression lost-mass
≤ 0.8%; swept detection chose dial 2 in 80/80 units. **T1 recorded as structurally
inapplicable to block architectures** (block keys weld decryptor to mediator; the
world-drive claim lives in out-to-body-block, which is healthy) — T1 was best-key-only
in the V1 registration; extending it to blocks was a script-level overreach, corrected.
Both architectures enter the V2 benchmark. The V2-2/V2-3 transferred-C3 requirement is
now MET (grown keys 100%, keyring 100%, menu 100%).

---

## 2026-08-11 — Environment NEVER fused (SJ correction, pre-V2-5-lock)

The pilot's "fuse env only when compression-viable" rule was data-dependent — the bucket
could fuse in some seeds and not others. SJ: a consistent rule beats an inconsistent
one, and there is a principled reason never to fuse: **agent-blocks respect a
*discovered* coherence (systems that maintain themselves); the environment as a whole
has no such coherence to respect.** SJ's earlier "possibly also fuse the environment"
meant "fuse only given a positive reason (simplicity/consistency); otherwise leave
unfused." Adopted: env members are always singleton elements, ringless like orphans.
(V2-3 qualification unaffected: its env buckets were single-variable, where the rules
coincide.)

---

## 2026-08-11 — V2-4 colony design (SJ): weak ring coupling FIRST; partitioned as diagnosis

SJ: "weak ring coupling is the real test I want this to pass." Colony builds coupled
(neighbour's action nudges each agent's environment patch, Gunnar-style weak strength).
**Pre-registered contingency: any colony failure is re-run in the partitioned variant —
if it persists, the cause is scale; if it vanishes, interference.** Attribution built
into the design rather than argued afterwards.

---

## 2026-08-12 — V2 sweep verdict + two defects found by investigation (remediation in flight)

Sweep: 240/240 units, 12.5 h, zero errors. First-pass verdict computed against the lock;
three "impossible" patterns investigated before reporting (standing rule). Findings:

**Defect A — deep-synergy world bug (ours).** Both channels were driven by the same
action, so E1⊕E2 changed only 5.7% of steps: the three-way parity silently collapsed to
"goal ⊕ slow drift", making G_P single-key visible ("unexpected sight" 100% for
best-key/grown = artifact, not sight). The audit checked marginal relations and missed
joint dynamics. Fix: channel 2 is now exogenous weather (E1⊕E2 = 49.2% ✓); the audit
gained a channel-independence check; mechanics test hardened; broken DS results archived
(`results/v2_5/ds_v1_broken/`); DS re-running on the fixed world.

**Defect B — registered-design defect: keyed conventions' INTAKE is scale-infeasible.**
Best-key and grown keys use the fused mega-state intake; at 49 colony variables the
joint Rest saturates (19,999 unique states / 20,000 samples) — intake reads bias for
everyone (uncaused G0 0.084; B0 0.348 vs true ~0.55), so net-intake ≈ 0 universally and
the signature degenerates to drive-above-floor: wires sign 20/20, no-core 0% clean.
**The no-core control caught the collapse — exactly its job.** Under the locked
interpretation rule (controls failing ⇒ fix estimators before interpreting), colony
best-key/grown are declared **intake-infeasible at scale** (feasibility-map correction,
control-driven); their colony CV/CU columns are void. Structural implication: at true
scale the keyed conventions hit the same wall as fused on the intake side — **only the
block philosophy currently has a feasible intake story at Gunnar scale** (SJ's design
instinct, validated structurally).

## 2026-08-12 — PRUNE REVIEW COMPLETE (SJ): the V3 roster

Confirmed after a naming clarification (the "best-key" collision between the V1
variable-level convention and the "blocks-as-best-key-menu" architecture is resolved in
`docs/DEFINITIONS.md`, which is now the governing glossary):

- **menu** — primary test going forward (100% goal recovery in every V2 world).
- **fused** — small-world gold standard (≤ ~10 variables).
- **grown keys** — held in reserve; kept only if V3 wants graded-synergy sensitivity
  (SJ to decide at V3 planning).
- **key-ring** — diagnostic only (menu−key-ring divergence measures partition quality).
- **best-key**, **pairwise** — retired (documented causes of death).
- **One world configuration only (as-is)**: the lookalike-free variant is retired — the
  winning tests found goals with perfect lookalikes present, so raw data needs no
  pre-cleaning (already implicit in the V2-5 registration; now ratified explicitly).

**SJ's forward observation (logged for V3+):** menu never requires the goal to belong to
any detected agent — any block can serve as its key — so it is structurally suited to
detecting goals held not by individual agents but by *systems of agents* (coalition-level
values). Unplanned, and potentially the most important property of the winning design.

---

**Genuine first-pass results (stable):** anchor — all five tests pass (key-ring's U2 at
75% = ring-intake semantics vs U2's absolute-intake intent; boundary noise around the
qualification's 85%); slow-meter — best-key & grown pass everything (slow G found 100%,
meters ≈0 thefts: SJ's witness expectation HOLDS for keyed tests); block tests show
meter thefts (F_sat 9/20 & 8/20, M8 5/20 keyring) — a real comparative finding to
re-read after remediation; colony blocks — menu CV1 100% vs key-ring 70% (the registered
partition-quality dependence, now measured), one systematic thief A6 (6/20) both
architectures. **Registered partitioned contingency launched** (colony0: blocks,
main+no-core) for scale-vs-interference attribution of the block failures, alongside
the DS rerun (~3 h total).

**Status of prior results:** fused *intake* already existed (the original cross-check;
identical numbers in every table). Fused *outbound* had never been run — deferred at the
options-memo stage because at 20k steps in the as-is world it would be smoothing artifact
(~131k state combinations vs 20k samples). It becomes measurable at longer runs; fused
convention runs use **~2M steps** (as-is; lookalike-free is comfortable sooner), other
conventions stay at 20k, run length stated per artifact and swept in Chunk 5.

**Generality notes (for the criteria discussion):** best-key is a uniform automatic rule
(no world-specific choices) but only decrypts two-input combinations; fused mega-state is
conceptually the most general but its data appetite doubles per added variable (collapses
computationally in bigger worlds); pairwise scales best and sees least. A three-lens
spectrum, not a ladder.

**Expected structural property of fused outbound (recorded before running):** because it
conditions on the joint past of everything else, it automatically screens duplicates and
mediators — e.g. the noisy action readout should lose its outbound credit to the perfect
action log, and the belief's environment-drive should be absorbed by the action line. If
so, the fused convention is the strictest "uncaused driver" detector, and G should stand
alone at its drive pole. Recorded as expectation, not criterion.
*(Outcome, same day: confirmed on seed 0 — G alone in the drive half under fused, both worlds.)*

---

## 2026-08-10 — Future idea logged, NOT built now (SJ): agent-level fusion

Run Gunnar's agent-detection stage first; fuse the variables *within each detected agent*
into one element (and optionally fuse the non-agent remainder into an environment bucket),
reducing the element count to (number of agents + 1). A principled middle ground between
pairwise and fused mega-state — and the natural way to scale the fused convention to
multi-agent worlds, where variable-level fusion collapses combinatorially (Gunnar's older
simulator, home of the `goal_progress` contrast case, has ~50 variables ⇒ variable-level
fusion is impossible there; agent-level fusion would not be). Deliberately deferred: Chunk 5
is enough work as it is. Goes on the Chunk 6 follow-up list.

---

## 2026-08-12 — V3 design LOCKED (SJ); glossary restructured; sequencing

Glossary: tests merged into one flat section; renames **fused-agents any-block** (was
"menu") and **fused-agents own-block** (was "key-ring"); DEFINITIONS.md governs all
vocabulary and Claude corrects mismatched usage (standing instruction, in memory).

V3 scope (SJ; corrected to INCLUDE the yardstick): colony-style worlds only. Design
picks: **two puppet-colonies** (one puppet each — fast copier; slow run-of-6-triggered;
puppets are captured goals, wired into the action but environment-driven); alias-colony
with **finer grid {0, 0.5, 1, 2, 5}%**; controls economy (alias controls at 1% only);
roster confirmed any-block primary + own-block diagnostic (fused sits out — colony
wall; grown keys excluded). Yardstick corrected to the **two-direction interventional
mirror** (goal-role probe + autonomy probe; "levers the world, unlevered by the world")
after Claude's "flipping the puppet does nothing" error was caught pre-build — the
captured puppet IS wired in; only the alias is inert. Do-style flips validated against
Gunnar's embedded goal_flip on the anchor bench before colony use. Access-premium table
is the headline exhibit. Estimated ~8–10 h overnight.

Sequencing (SJ): before any V3 run — update V2 write-up next-steps (done) and ship
`value-detect-v2-master` (this session).

---

## 2026-08-12 — V3 built: worlds, yardstick, audits; bench validates (pre-registration next)

Puppet mechanics live inside the colony generator (captured goals: wired in,
environment-driven); alias-colony appends inert twins post hoc (base columns
bit-identical to the plain colony, verified per level). Emergent finding recorded in
the A1 audit: the fast puppet copies the patch its agent's belief also copies, so the
two partially XOR-cancel — **a puppet that pacifies its agent** (~22% tempo, not ~50%).
A2's trigger verified flip-by-flip: 353/353 flips follow a 6-run of its patch; tempo
1.77% ≈ a true goal's — indistinguishable by rate alone.

Yardstick: THREE cipher bites during build, each caught by tests/bench before any real
run — the role probe unconditioned (fixed: agent-context conditioning, mirroring
Gunnar's own interventional score), the autonomy readout saturating on fast variables
(fixed: two-scale terms), the autonomy terms unconditioned (fixed: full agent context).
Final bench: his embedded goal_flip and our do-style flip agree (only the goal-slot
carries a role-effect); our two-direction verdict then uniquely selects the true goal
— belief/patch refused as levered levers, readouts refused as unlevered, **the slow
puppet UNMASKED (role yes, autonomy yes)**, and the zero-noise alias refused while
being bit-identical to its goal: the access-premium theorem case demonstrated on the
bench. 44 unit tests pass.

---

## 2026-08-12 — V3 registration fully ratified (SJ, pre-departure)

SJ reviewed the solo-filled parameters (yardstick at alias endpoints only; 2k/6k
operated steps, 300 perms; lag-2/3 columns indicative; house standards carried; the
pre-named inversion zone) and confirmed all of them with hours to spare before any
result was observed. The lock stands exactly as written; run + write-up proceed as one
autonomous task per SJ's instruction.

---

## 2026-08-14 — V3 COMPLETE; the simple experiment class closes

Sweep 340/340 in 37.5 h, zero errors. All registered predictions landed (fast puppet
refused 20/20 — hard criterion; slow puppet defeats passive lag-1 tests 20/20 —
registered defeat; yardstick unmasks it 20/20 and refuses the bit-identical twin at 0%;
breaking point ≈1–2% twin noise; zero inversions). Anomalies investigated before
interpretation: puppet-world thief = the V2 interference wire A6 (attribution
transfers; fresh partitioned confirmation = open item); alias no-core "failure" = the
**twin-channel** (disconnected goals genuinely drive their recordings — instrument
correct, control spec lesson); alias scrambles pass (appendix). own-block min 75–80%
(partition softness; diagnostic role). Write-up + E23 [the v3 log entry, now `ELOG_V3.md`; inserted into Gunnar's log as
E21 — see 2026-08-18] + session summary shipped to
docs/ per SJ's autonomous run+write-up instruction; open items listed in the write-up.
Next: V4 planning with SJ (systems-of-agents environments).

---

## 2026-08-14 — Paper draft (arXiv style) written; SJ's framing notes incorporated

`paper/value_discovery.tex`: v1–v3 as a formal paper. Incorporates SJ's three notes:
(1) the **Omohundro inversion** as the central framing — Omohundro: values first, then
made empowered/stable; our hypothesis: whatever is empowered-and-stable thereby serves
as the values (hence "value" not "goal" discovery); (2) the **single-variable-value
limitation** with SJ's conjectured remedy (UAD boundary detection to find sub-systems
within an agent, then score sub-systems); (3) **why structure rather than behaviour**:
an agent concealing its objectives via decision noise weakens the behavioural signal,
but the most-driving component remains structurally locatable and can be isolated.
Not compiled locally (no TeX); structurally verified. Two bib placeholders flagged.
Not for submission (disclosed in-paper).

---

## 2026-08-18 — Design documents retired from the repository (SJ)

`VALUE_DISCOVERY_DESIGN.md` and `TECHNICAL_ADDENDUM.md` were written as scaffolding for
the implementing model at the start of v1 and are not part of the final project: the
theoretical basis lives in the paper draft and every design decision is dated in this
log. Removed from the public repository; earlier entries in this log that cite "the
design document" or "the addendum" refer to those retired files and are left as written,
with a square-bracketed insertion at each mention reproducing the passage referred to
(SJ's request, so the dated record stays accurate yet readable by anyone; see the reading
note at the top). The same treatment was given to the three other documents that cite
them (`CHUNK4_OPTIONS_MEMO.md`, `SUCCESS_CRITERIA.md`, `V3_PLAN.md`). Both files remain
in SJ's private project folder.

---

## 2026-08-18 — Publication review follow-ups (SJ): summaries labelled; v1 mechanism sentence corrected

**Session summaries kept and labelled.** SJ queried whether `docs/conversations/` was
model-facing scaffolding like the retired design documents. It is not: it is Gunnar's
house convention (`PROJECT_INSTRUCTIONS.md` asks for a summary after each significant
session, in his template — decisions and rationale, not a transcript), and the v3 (E21) pull
request includes one. SJ chose to keep them and label them: each summary now opens with a
one-line statement of what it is, the docs maps say the same, and the v4 summary moved
into `docs/conversations/` to match.

**v1 write-up corrected (reverses the 2026-08-10 choice to leave it unchanged).** The
`goal_progress` bullet in `WRITEUP_V1.md` now says best-key's blind spot there was
**near-frozen variables, not slow meters**, with the original sentence preserved in a
dated bracket and the retracted mechanism spelled out (all six thefts by the ≈0%-change
`Steel1_goal` inside the untrimmed settling period; the genuinely slow `Solar1_goal`
rejected 20/20; fix = z = 3 gate + burn-in; best-key's residual 6/20 on the moving meter
is a witness effect). The conclusion's "slow-meter effects" reworded to witness effects
with the same bracket. Matching brackets in `ELOG_V1.md` and the v1 session summary.
The shipped `value-detect-v1-master` bundle is left as it was (frozen snapshot).

---

## 2026-08-18 — Paper: sole authorship, AI statement, references resolved, wording (SJ)

SJ's review of the paper draft: (1) **SJ Beard is the sole author** — affiliations
Principles of Intelligence and the Centre for the Study of Existential Risk, University
of Cambridge; Claude removed from the author list, per the standing convention that AI
systems are not listed as authors because authorship carries a responsibility that
cannot be delegated to them. A starred title-page note reads "This unpublished paper
draft was written by Claude and reviewed and approved by the author"; the closing
section is retitled **Statement on use of AI**. (2) References resolved: Abel et al.,
"Plasticity as the Mirror of Empowerment", NeurIPS 38 (2026) 164340–164374, with the
arXiv link (2505.10361, verified against the arXiv record: title, 16 authors, NeurIPS
2025); Zarncke, "Foundations of Unsupervised Agent Discovery in Raw Dynamical Systems",
technical report, AE Studio, 2025. (3) Wording: "UAD locates agents' boundaries. We ask
what drives them, and specifically what plays the role of a discovered agent's values"
(the old sentence wrongly implied values lie inside the agent — v3/v4 found drivers can
lie outside); hypothesis heading now "inverting the classic AI drives argument";
"foreign worlds" → "more complex worlds" everywhere (paper, README, v3 write-up);
Experiment 3 heading now "how easily can the instrument be fooled?".

---

## 2026-08-18 — Experiment-log numbering: E-numbers only where we insert into Gunnar's log (SJ)

SJ spotted that the pull-request entry was labelled E23 although only the v3 entry is
being inserted into `agency-detect/docs/EXPERIMENTS.md`, whose last entry is E20 (checked
against Gunnar's live repository, unchanged since 24 June). **Decision (SJ):** E-numbers
are used only where an entry actually enters Gunnar's numbering — so the inserted v3
entry is **E21** — and our own documents use the programme's own numbering (V1–V4).
Applied: the PR entry retitled E21, its "Why" reworded to cite v1/v2 by name rather than
as log entries E21/E22, and the PR branch renamed `value-discovery-e21`; our files
`ELOG_E21/E22/E23.md` renamed `ELOG_V1/V2/V3.md` (v1 and v2 marked "not inserted"; v3
marked "inserted as E21"); the v4 file renamed `ELOG_V4.md` and left unnumbered, since
Gunnar's deployment-pipeline repository has no experiment log (its adaptor note loses the
E24 label likewise); every mention updated across both repositories, with brackets at the
old numbers in this log's dated entries. Frozen bundles untouched.

---

## 2026-08-18 — Pull requests opened (SJ's approval); account flag lifted

With SJ's explicit go-ahead after review of the texts, two docs-only pull requests were
opened: **GunnarZarncke/agency-detect#1** (E21 log entry + v3 session summary; branch
`value-discovery-e21`) — https://github.com/GunnarZarncke/agency-detect/pull/1 — and
**GunnarZarncke/deployment-pipeline-simulator#1** (adaptor note; branch
`value-discovery-adaptor-note`) — https://github.com/GunnarZarncke/deployment-pipeline-simulator/pull/1.
Earlier in the day the new SJ-Beard account had been auto-flagged by GitHub (profile,
repos and images returned 404 to the public; SJ opened a support ticket); by the time the
PRs were opened the flag had been lifted and everything was publicly visible. SJ has
messaged Gunnar directly, since notifications from a flagged account may not have been
sent. Publication complete; nothing pending. SJ away ~10 days from 2026-08-18.

---

## 2026-08-29 — Gunnar's PR feedback: include the code, not pointers (SJ)

Gunnar (via SJ): the agency-detect PR "does not include code even though it references
code… seems inconsistent". Fair — and the v1 design had anticipated exactly this use
("mirroring the house style of Gunnar's packages so the whole thing could later be
dropped into a copy of his repo as a pull request"). Checked against his conventions
first: packages are top-level folders (src/tests/scripts/pyproject), results are
generated and gitignored, never committed; repo licence Apache-2.0.

**Done (SJ's go-ahead):** (1) agency-detect PR #1 now ships the whole `value_detect/`
package (360 KB, 39 files; MIT, contributed under Apache-2.0; pyproject given a
self-contained licence field, avoiding the ../LICENSE editable-install bug his packages
have). Its 44 tests pass run inside the fork against his `uad_handles`/`agency_detect`
in place. E21 entry moved to its chronological place after E20; Code map row added;
Artifacts/Reproduce sections now point in-repo, archived artifacts still in
SJ-Beard/value-detect (matching his no-committed-results convention). Package README
rewritten for the new home (the old one was stale v1-era text; the copy in our own repo
rewritten to match, framed for the standalone repo). (2) deployment-pipeline PR #1 now
ships `value_detect_pipeline/` (adaptor module + tests + README) — the adaptor needs
only numpy/pandas plus his own simulator, so it is fully runnable in his repo (both
tests pass inside the fork); the probe scripts, which need `value_detect`, stay in the
canonical repo and the note says so. Both PR titles/bodies updated (no longer
"docs-only"). Staging clones were re-created from GitHub (scratchpad had been cleaned).

---

## 2026-09-09 — v3 slow-puppet claim corrected (SJ); paper revised and built; v5 published

The v5 comparison (published at
https://github.com/SJ-Beard/active-v-passive-value-detect) showed that the slow
captured goal's lag-1 intake leak was above floor in this repository's own stored v3
tables (net ≈ 0.028 nats, drive/intake ≈ 14×) and that the v3 "defeat" ran through the
signature's leak-tolerant 9× clause — a strictly gated passive stability test refuses
the same impostor 20/20. **SJ approved the dated correction brackets** now in
`WRITEUP_V3.md`, `ELOG_V3.md` and the v3 session summary ("defeats lag-1 passivity" →
defeats the leak-tolerant clause; the twin case remains the only interventional-only
gap). The paper is revised as flowing text per SJ (abstract, contributions,
Experiment 3, Discussion incl. a new "Subsequent experiments (v4 and v5)" paragraph,
limitations, future work) and now builds locally (MacTeX; 10 pages, no errors); the
built PDF is committed alongside the source.
