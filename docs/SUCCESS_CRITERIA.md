# Pre-registered success criteria — Chunk 5 (v1 instrument test)

**Status: LOCKED 2026-08-10 (SJ). No changes after this point; the sweep runs against
this document as written.** SJ's note at lock: the expected pairwise V2 failure is
welcome — we are evaluating several versions of the test, pairwise looks likely to be
dropped, and documenting *why it fails* now beats preserving it on a technicality.

*Build-time calibration amendment (pre-sweep, 2026-08-10):* C2's original wording ("no
score above floor anywhere") fails by pure chance arithmetic — ~27 comparisons at a 95th
percentile floor make at least one false positive the *expected* outcome in most seeds.
C2 is amended to: (a) the count of above-floor scores in scrambled data lies within the
chance band (binomial, 5% rate) — this doubles as the calibration check that the floor
machinery itself is honest; and (b) no variable exhibits the value signature with floors
at the 99.5th percentile. Amended before any sweep ran; no data was consulted.

*Build-time calibration amendment #2 (pre-sweep, 2026-08-10):* the smoke run exposed that
the signature's ratio clause, read on **raw** values, is not bias-safe: in high-cardinality
settings (the C3 world under best-key) estimator bias inflates raw drive enough to satisfy
"9× intake" spuriously. The clause is restated in **floor-adjusted (net) terms**: with
net drive = max(0, drive − its floor) and net intake = max(0, intake − its floor), condition
3 reads "net drive > 0 and net drive ≥ 9 × net intake" ("intake at floor" is the special
case net intake = 0). This changes no registered expectation on the six main tests (wires
still share the signature under pairwise; mediators still excluded); it prevents pure bias
from impersonating drive in the controls. Amended after a 1-seed smoke run at toy settings
(4k steps, reduced shifts), before any real sweep data existed.

Finalized, per plan, after the single-seed Chunk 4 evidence and before any multi-seed run.
Changes from the design document's working criteria are listed at the end with reasons —
all are mechanism-driven, none are tuned to a sweep result (no sweep has run).

## The six tests

{world as-is, lookalike-free} × {pairwise, fused mega-state, fused + best-key} — six
analyses, co-equal, every criterion evaluated **per test** with identical wording.
Primary settings: lag 1; 20,000 steps (pairwise, fused + best-key) and 2,000,000 steps
(fused mega-state — its outbound needs the data). Ground-truth roles are used only to
*evaluate* outcomes, never inside the measurement (house rule).

## Noise floors (the gate everything passes through)

For each test, each variable, each directed score (intake; system-flavour drive;
environment-flavour drive): a null distribution is built by **circularly time-shifting
that variable's column** against the fixed remainder and re-running the *identical*
scoring procedure (including the best-key maximisation where that convention is in use —
the null must mirror the measure, so its bias inflation is priced in).

- **"Above floor"** = the real score exceeds the **95th percentile** of its own nulls.
- **"At floor"** = not above floor.
- **Rankable** = a variable whose total flow (intake + drive) is above floor. Polarity is
  only interpreted for rankable variables (the W lesson: below the floor, polarity is a
  ratio of two biases and means nothing).
- Shift counts: ≥200 where cheap (pairwise; fused + best-key); for the fused mega-state
  convention ≥50 per seed pooled across seeds (≥1000 pooled samples per score) to keep
  total compute overnight-scale. Achieved counts and percentiles are reported.

## The value signature (the headline construct)

A variable exhibits the **value signature** in a given test and seed if, simultaneously:

1. its **system-flavour drive is above floor** (it measurably drives the system),
2. it is **rankable** (total flow above floor), and
3. its **intake is at floor** *or* its **drive is at least 9× its intake**
   (polarity ≥ +0.8).

Condition 3's disjunction is SJ's revision (2026-08-10): real systems leak — every part
can be affected by its environment — so a value-core must not be disqualified merely for
measurable intake; what matters is being *overwhelmingly* a driver. The 9× bar sits well
above genuine mediators (≈3–4× under best-key on seed 0) and well below G (≈100×+). The
same threshold applies to every test.

This is the theory's operational definition of a value-core — *drives without being
driven (much)* — stated identically for every test. Rank positions are reported but are
not the headline criterion (rankings shuffle for known per-convention reasons; the
signature does not).

**Known consequence, pre-registered:** under the pairwise tests the action wires' intake
reads as ~nothing (cipher-hidden) and their polarity as ~+0.99, so A (and A_alias where
present) are expected to earn the signature there too — **V2 is expected to FAIL in the
two pairwise tests**, named in advance. This is the cipher lesson at criteria level:
pairwise measurement cannot tell a goal from a wire in a world with encrypted
composition. The uniqueness claim rests on the fused and fused + best-key tests.

## Criteria (each evaluated per test, over N = 20 seeds)

| ID | Criterion | Threshold |
|---|---|---|
| **V1** | G exhibits the value signature | ≥ 80% of seeds |
| **V2** | **No other variable** exhibits the value signature | ≥ 80% of seeds |
| **U1** | G above B on polarity (fails the seed if G is unrankable) | ≥ 90% of seeds |
| **U2** | B has the largest intake among the agent's own variables {B, S, A, G} | ≥ 80% of seeds |
| **T1** *(fused + best-key tests only)* | G's **environment-flavour** drive is above floor (the "drives the world" reading — only this convention can decrypt it) | ≥ 80% of seeds |

## Controls (pre-committed; same floor machinery)

| ID | Control | Criterion | Threshold |
|---|---|---|---|
| **C1** | **No-core** variant (G disconnected from the action; world otherwise identical) | G does **not** exhibit the value signature; and no variable does | each ≥ 80% of seeds |
| **C2** | **Scrambled** data (independent time-shuffle of every column) | (a) count of above-floor scores within the 5% chance band (floor-calibration check); (b) no variable exhibits the value signature at 99.5th-percentile floors *(amended pre-sweep — see status note)* | each ≥ 80% of seeds |
| **C3** | **`goal_progress` contrast** (Gunnar's older multi-agent simulator) | `goal_progress` does **not** exhibit the value signature (expected: intake above floor — a driven progress meter, not a value) | ≥ 80% of its seeds |

C1 and C2 run under all six tests. C3 runs under pairwise and fused + best-key only: that
world has ~50 variables, where variable-level fusion is combinatorially impossible — the
honest statement of the fused convention's scaling limit (and the opening for the
agent-level-fusion idea logged in DECISIONS.md).

## Pre-registered expectations (reported, not pass/fail)

- Pairwise tests: the action wires (A, and A_alias where present) outrank G on polarity —
  the documented cipher-blindness — and are expected to share the (revised) signature
  there, failing V2 as noted above.
- Fused tests: G is alone in the drive half of the map (screening property).
- Environment flavour under pairwise and fused: G reads at floor (cipher; no key device).
- Lookalike orderings (alias ≥ readout where aliases exist); D's witness-inflation in
  system flavour with a dead environment flavour; E mid-map.
- Run-length {2k, 5k, 20k; fused: 200k, 2M} and lag {1, 2, 3} sweeps: stability maps
  reported descriptively, no pass/fail (criteria are evaluated at the primary settings
  only). Expected: pairwise/best-key degrade gracefully at 2k; fused outbound is not
  computed below its feasible lengths.

## Interpretation rules, fixed in advance

- **All six tests pass** their V/U/T criteria and all controls pass ⇒ the instrument
  works, with per-convention limits as documented. **Some tests fail** ⇒ report which,
  with mechanism; a convention failing for a demonstrated structural reason (e.g.
  pairwise cipher-blindness) is a finding about the convention, not a failed instrument,
  *provided* V1/V2 hold in at least the fused and fused + best-key tests.
- **V2 failing anywhere** (another variable earning the signature) is a serious result:
  either a decoy fools the instrument (reportable failure) or the world contains an
  unplanned value-like structure (investigate, report either way).
- **Controls failing** (signature in no-core, or anything above floor in scramble) ⇒ the
  floors or estimators are broken; fix before interpreting anything else.

## Changes from the design document's §6 working criteria, with reasons

1. "G tops the asymmetry ranking in ≥80% of seeds" → replaced by the **value signature**
   (V1) + **uniqueness** (V2). Reason: Chunk 4 showed rank-1 is convention-dependent for
   mechanistically documented reasons (cipher-blindness of pairwise), while the signature
   is the theory's actual claim and held for G — uniquely — in all six seed-0 analyses.
   Rankings remain reported.
2. "B tops the intake ranking among the true loop variables" → **U2** restricted to the
   agent's own variables {B,S,A,G}. Reason: E (a loop member on the world side) ties or
   edges B's intake under the fused convention; the meaningful claim is that the belief is
   the *agent's* most world-driven part.
3. Floors formalized (95th percentile, procedure-mirroring, rankability gate) — this was
   always the promised "calibrate before the sweep" step.
4. Seed count 20 and thresholds 80/90 retained from the provisional agreement
   (confirmed by SJ 2026-08-10; floors bundle also approved as specified above).
5. Signature condition 3 relaxed from "intake at floor" to "at floor OR drive ≥ 9× intake"
   (SJ, 2026-08-10): a definition demanding literally-zero intake would wrongly disqualify
   real-world value-cores, which all leak. Consequence accepted and pre-registered: V2
   expected to fail in the pairwise tests (wires share the relaxed signature there).
