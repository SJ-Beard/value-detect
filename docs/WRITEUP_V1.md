# Unsupervised value discovery inside an agent — v1 results

**SJ Beard, with Claude (implementation & analysis) · 2026-08-10**

## Background

This line of work extends Gunnar Zarncke's *Unsupervised Agent Discovery* (UAD; https://github.com/GunnarZarncke/agency-detect) finds agents in raw multivariate time series as variable clusters that approximately satisfy a Markov-blanket condition against their surroundings; its `uad_handles` package adds a small **handle benchmark** — a synthetic world with an embedded agent loop (belief → action → environment → sensor → belief, with a goal entering the policy) plus embedded handle *operations* (sensor-flip, action-block, goal-flip) that separate real handles from passive look-alikes, the subject of Zarncke's access-model ("handles") paper. We ask a question one level inward.

## What we did

UAD finds *agents* — variable-sets that hold an approximate Markov blanket against
their environment. This project points the same plant-and-recover style one level inward:
finding **value-like structure inside an agent** from passive data alone. The claim under
test: values have a *directional* signature — they are the parts that most strongly drive
their surroundings while being least driven in return (motivated by the
empowerment/plasticity trade-off, arXiv:2505.10361, and the resulting pressure to
specialise internally toward plastic belief-like and protected value-like poles).

v1 is an **instrument test, not a theory test**: we planted structure and asked whether a
passive directional measure recovers it. The world is `uad_handles`'
`SyntheticHandleWorld`, used exactly as-is (passive rollouts; the UAD repository untouched;
our code imports it from a sibling package `value_detect/`). It was built by Zarncke,
before this project existed, for a different question — so nobody tuned the world to
flatter the measure. G (goal, self-flipping at 1.5%) is the planted value-core; B (belief) the
planted intake pole.

## The instrument

Per variable, two directed quantities (transfer-entropy style, UAD's discrete plug-in CMI
conventions: Laplace α = 0.1, nats): **push-in** (what everything else's past adds about
its next step) and **push-out** (what its past adds about everything else's next step;
also an environment-only flavour). Three "Rest" conventions were run as co-equal tests,
because their disagreements turned out to be findings:

- **pairwise** — one-at-a-time flows, summed;
- **fused mega-state** — both directions against the fused joint state of all others
  (2M-step runs; the fused outbound needs the data);
- **fused + best-key** — fused intake; outbound takes the best reading over "no key" and
  each single extra conditioning variable (an automatic decryption device, same rule for
  every variable).

Every score is gated by **noise floors**: ≥200 circular-shift nulls per variable
mirroring the exact scoring procedure (fused: 50/seed pooled across seeds), 95th
percentile. Success criteria were **pre-registered and locked before the sweep**
(`docs/SUCCESS_CRITERIA.md`): the headline construct is the **value signature** — drive
above floor, rankable, and net intake at floor *or* net drive ≥ 9× net intake — with
required uniqueness (nothing but G may hold it), G-above-B, controls (no-core variant,
scrambles, and the `goal_progress` variable of UAD's older multi-agent simulator as a
must-reject contrast), 20 seeds, 80/90%
thresholds.

## Results (20 seeds; full tables in `results/chunk5/CRITERIA_VERDICT_FINAL.md`)

| Test | G's signature | Uniquely G | G > B | T1 (drives world) |
|---|---|---|---|---|
| fused, both configs | **100%** | **95% / 100%** | **100%** | — |
| fused+best-key, both configs | **100%** | **95%** | **100%** | **100%** |
| pairwise, both configs | 5% | 0% (wires 20/20) | 5% | — |

- **The signature finds the planted value and only it** wherever the convention can see
  through the world's XOR composition. Controls all pass for those conventions: the
  no-core variant strips G of the signature; scrambled data shows above-floor readings at
  ≈ the designed 5% chance rate; the sole intruders across all fused/best-key tests were
  1-in-20-seed blips by the pure-noise variable — the false-positive rate the floors
  admit by construction.
- **XOR composition acts as a cipher.** Each input of `A = B ⊕ G` is invisible to
  pairwise measures unless the other input (the "key") is conditioned on; measured
  readings match hand-derived values to ~3 decimals (`results/chunk4/DIAGNOSIS.md`).
  Pairwise's failure is therefore structural — it cannot tell the goal from the action
  wire, and with floors in place G's pairwise signal is indistinguishable from nothing.
  We kept it as the documented baseline; re-timing the world would not rescue it (tested).
- **The fused outbound auto-screens duplicates and mediators** (conditioning on the joint
  past of everything else): under it, G is literally the *only* variable in the drive
  half of the intake/output map. The benchmark's aliases behave exactly as Zarncke's handles paper
  predicts: passively, the clean logs read ≥ their noisy readouts; under pairwise the
  action-log shares the "value" verdict — the passive-limit boundary, quantified.
- **UAD's own `AgentDetector` on our trace** finds the agent's body as one blanket-valid
  cluster (leakage 0.001 vs tolerance 1.0), sets W outside — and drops G as an invisible
  singleton (symmetric MI ≈ 0: the cipher again, and UAD's own observation that rarely-changing
  variables are the hard cases). Boundary-finding and value-finding are complementary axes.
- **One pre-registered control failed, informatively: `goal_progress`** (UAD's older
  multi-agent simulator, 1 solar + 1 steel world) is correctly rejected under pairwise
  (100%) but steals the signature in 30% of seeds under best-key. **Best-key's blind
  spot here is near-frozen variables, not slow meters.** [Corrected 2026-08-18. This
  bullet originally read: "slow cumulative meters have autocorrelation-inflated
  shuffle-floors, so their net intake reads zero while witness-like drive clears floor.
  Best-key's blind spot is slow meters. (Block-preserving nulls are the known fix to
  try.)" The v2 re-examination of the stored v1 records
  (`results/v2_1/C3_MECHANISM.md`) retracted that mechanism: all six thefts were by
  `Steel1_goal`, which changes in ≈ 0.0% of steps — a handful of transitions, all inside
  the simulator's first ~55 settling steps, which the v1 harness had not trimmed — so
  every one of its scores sat at its own unstable noise floor and the gates fired on
  hair-thin residuals. The genuinely slow meter, `Solar1_goal` (~1.1% change rate), was
  correctly rejected in 20/20 seeds under both conventions; the inflated-floor story
  never occurred. The v2 fix was a z = 3 margin gate on the floors plus a 2,000-step
  burn-in, not block-preserving nulls. After that fix, best-key alone still admits the
  moving meter in 6/20 seeds — a witness effect of single-key conditioning, attributed in
  v2 rather than patched (see `WRITEUP_V2.md`).]

## Conclusion (SJ)

The experiment shows the **theoretical possibility of detecting goals this way** — but
none of the tests as built is good enough yet to carry the program forward alone. The
fused mega-state cannot expand to worlds at the scale of UAD's multi-agent simulator
(state count doubles per variable; ~50 variables is hopeless). Fused + best-key fails
twice over: a single key cannot decrypt compositions with more than two inputs (two
sensors → two beliefs + goal → action re-raises the cipher; sharpest for parity-like
rules — graded rules leak more, so where the cliff sits in realistic worlds is an
empirical question), and the `goal_progress` failure warns of witness effects — meters
and other history-recording variables — in richer environments [originally "slow-meter
effects"; corrected 2026-08-18, see the control bullet above]. These are **soft failures**: both conventions pass this
experiment's locked conditions, so the theory stands — but the instruments will likely
fail in the experiments we want to run next. **Next step: build at least one more test —
"fused agents + fused environment" (run UAD's agent detection first, fuse within each
detected agent plus an environment bucket, reducing elements to #agents + 1) — and
re-run this benchmark with it.** That is also the natural bridge to UAD's 50-variable
multi-agent world, where the `goal_progress` contrast lives.

## Follow-ups beyond that

Block-shift (autocorrelation-preserving) nulls; a G_alias variant to map the passive
breaking point for the goal role (a follow-up to Zarncke's handles paper); hidden-G;
richer/graded decision rules; and the real question the instrument now makes askable —
whether value/belief polarisation *emerges* in evolved systems rather than being planted.

## Reproduce

Environment: double-click `setup_env.command` (once per machine). Then:

```
~/.venvs/value-detect/bin/python value_detect/scripts/chunk2_wrap_world.py
~/.venvs/value-detect/bin/python value_detect/scripts/chunk3_estimator_report.py
~/.venvs/value-detect/bin/python value_detect/scripts/chunk4_directional_scores.py
~/.venvs/value-detect/bin/python value_detect/scripts/chunk5_sweep.py --seeds 20 --jobs 4
~/.venvs/value-detect/bin/python value_detect/scripts/chunk5_fused_pooled_floors.py
~/.venvs/value-detect/bin/python value_detect/scripts/chunk5_aggregate_final.py
```

(~40 min + ~25 min on an M-series laptop.) Figures: `docs/writeup_figures/`
(signature-rate heatmap; six-panel intake/output maps; change-frequency chart). Design
history and every decision, dated: `docs/DECISIONS.md`; pre-registration:
`docs/SUCCESS_CRITERIA.md`; drop-in log entry: `docs/ELOG_V1.md`.

*Honesty notes: the protocol was soft-blind (the implementing model had read the world's
source; protection = independent origin of the world, pre-registration, controls,
multi-seed). Two calibration amendments were made to the locked criteria pre-sweep, both
documented in place (multiple-comparisons handling for scrambles; floor-adjusted ratio).
A small quirk in UAD's older multi-agent simulator, flagged in passing: several "dynamic" thresholds
are sinusoids of a constant (fixed memory length), so their intended time-variation never
happens; agent-specific offsets still differ, so its published results stand.*
