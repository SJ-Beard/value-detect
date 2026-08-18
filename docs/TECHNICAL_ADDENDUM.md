# TECHNICAL_ADDENDUM — Unsupervised Value Discovery (v1)

Companion to `VALUE_DISCOVERY_DESIGN.md`. Written for the implementing Claude; SJ reads the design document. Everything below was read from the repository source or the cited papers during the chat phase. Items marked **[verify]** must be checked against the code on arrival before being relied on.

## 1. World mechanics as read from source

File: `agency-detect-master/uad_handles/src/uad_handles/minimal.py`, class `SyntheticHandleWorld`.

- Nine binary observed variables, observation order `VAR_NAMES = [B, S, A, E, G, S_alias, A_alias, D, W]`; ground truth `TRUE_LOOP = (B, S, A, G, E)`.
- Within-step readout (`_observe_from_state`, passive mode, ⊕ = XOR, Bern(p) = Bernoulli draw):
  - `S_line = E ⊕ Bern(sensor_noise)`
  - `A_line = (B ⊕ G) ⊕ Bern(action_noise)`
  - `S_obs = S_line ⊕ Bern(handle_obs_noise)`, `A_obs = A_line ⊕ Bern(handle_obs_noise)` — these are the columns named S and A in the trace
  - `S_alias = S_line ⊕ Bern(alias_noise)`, `A_alias = A_line ⊕ Bern(alias_noise)`
  - the observed G column is `G_eff`; in passive mode `G_eff = G`
- Transition (`step`): the dynamics **reuse the recorded alias columns as the effective line values** (`S_eff := S_alias(t)`, `A_line := A_alias(t)`; source comments call the aliases "clean passive logs of the line values"). Then:
  - `E(t+1) = E(t) ⊕ A_line ⊕ Bern(env_noise)`
  - `B(t+1) = S_eff ⊕ Bern(belief_noise)`
  - `G(t+1) = G(t) ⊕ Bern(goal_flip_rate)`, with `goal_flip_rate = 0.015` (read directly from the signature)
  - `D(t+1) = E(t+1) ⊕ Bern(distractor_noise)` — note D is driven by the **contemporaneous** new E, not lagged E
  - `W(t+1) = Bern(0.5)`
- **Consequence for predictions.** In the recorded data, the causally effective drivers of `E(t+1)` and `B(t+1)` are literally the alias columns. The "clean logs" comment implies `alias_noise` defaults to 0 **[verify — constructor defaults for sensor/belief/action/env/distractor/alias/handle_obs noise were NOT read; only goal_flip_rate was]**. If alias_noise = 0, then by construction `A_alias` ≥ `A_obs` on drive scores and `S_alias` ≥ `S_obs` on intake fidelity. This *sharpens* the design document's §4 prediction "A_alias may show apparent drive" to "expect alias ≥ obs". The G-vs-B headline is untouched (no goal alias exists in v1). The prediction table is pre-registered: propose the sharpened version to SJ for sign-off *before* the first scored run, and change it only with that sign-off.
- Data generation: `generate_passive(seed, n)` builds the world, burns in 100 steps, then rolls out n passive steps. `rollout` returns `DataSet(xs, xns, op_codes, handles)`. Use `xs` as the time series; `xns` is a same-step preview readout — do not splice it into the series **[verify semantics before use]**.
- Lag structure: genuinely lag-1 throughout, except D's synchronous coupling to E above — under lag-1 transfer entropy D's scores depend on the offset convention; observe and report rather than pre-committing.

## 2. Estimand menu (basis of the Chunk-4 options memo to SJ)

Notation: X = candidate variable; R = "rest" under the chosen flavour; all quantities on the stationary post-burn-in trace, in nats.

- **Push-in** (plasticity-like): `TE_in(X) = I(X_{t+1}; R_t | X_t)`, with R instantiated as:
  - (a) full joint rest tuple — 8 binary variables ⇒ 256 joint states; feasible with the smoothed plug-in at N ≥ 20k but bias-heavy; only use with null calibration;
  - (b) pairwise sum `Σ_j I(X_{t+1}; X_j,t | X_t)` — tractable, ignores synergy/redundancy; acceptable for *ranking* in a near-tree-structured world;
  - (c) small hand-chosen conditioning sets (≤ 2 variables).
- **Push-out**, two flavours:
  - system flavour: `TE_out(X) = I(R_{t+1}; X_t | R_t)` (same R menu and caveats), or the pairwise sum `Σ_j I(X_j,t+1; X_t | X_j,t)`;
  - environment flavour (the headline "drives the world" quantity): `I(E_{t+1}; X_t | E_t)` — single-variable conditioning, cheap, exact plug-in is comfortable. **Do not additionally condition on A**: G reaches E through A (G→A→E), and conditioning on the mediator screens off precisely the influence being measured.
- **Asymmetry score:** push-out − push-in. Normalisation options for the memo: raw nats; polarity = (out − in)/(out + in) ∈ [−1, 1]; or z-score against circular-shift nulls. Recommend reporting raw + polarity, with nulls supplying significance.
- **Sharpened qualitative predictions** (following §1): G — environment-flavour push-out clearly positive, push-in ≈ 0 beyond estimator bias (nothing drives G), extreme polarity. B — push-in ≫ 0 (via the sensor line), moderate push-out (via A). A_obs and A_alias — high on both axes, alias ≥ obs. S and S_alias — intake-heavy. E — mid-map (driven by A, drives the sensor line). D — intake-heavy or near-null depending on the synchronicity convention (§1). W — null on everything.

## 3. Estimator conventions

- Smoothed plug-in CMI following `agency-detect-master/agency_detect/src/agency_detect/markov_blanket.py`: Laplace α = 0.1 applied to joint cells with the marginal-consistent scaling used there (e.g. the xz margin gets α·card_y), natural log. Reimplement cleanly inside `value_detect` with tests; matching conventions matters, importing private internals does not.
- Plug-in bias inflates with cell count and shrinks with N. Never compare raw values across estimands of different cardinality — compare each score to **its own null distribution**: circular time-shifts of the candidate column against the fixed remainder (≥ 200 shifts; report the achieved percentile). Mirror the null-model conventions in `agency-detect-master/uad_worm/src/uad_worm/nulls.py`.
- Sample sizes: N ∈ {2k, 5k, 20k}; expected goal flips ≈ 0.015·N (≈ 300 at N = 20k — adequate for G's transition statistics). Full-joint-R estimands want N ≥ 20k; otherwise prefer the pairwise or small-set variants.

## 4. Analytic unit-test targets (Level 1)

- Delayed copy `Y_{t+1} = X_t`, X iid fair: TE(X→Y) = ln 2 ≈ 0.6931 nats; reverse direction ≈ 0.
- Noisy copy `Y_{t+1} = X_t ⊕ Bern(p)`: TE = ln 2 − H_b(p), where H_b(p) = −p·ln p − (1−p)·ln(1−p).
- Independent iid pair: 0 within finite-sample/smoothing bias; derive the acceptance band empirically from permutations rather than fixing a constant.
- Chain X→Y→Z (lag-1 links): the mediation exhibit — `I(Z_{t+1}; X_t | Y_t) ≈ 0` while the unconditioned lag-2 dependence of Z on X is positive. This doubles as the demonstration of why the environment flavour must not condition on A.
- Decomposition audit: the classical ancestor of the paper's conservation result is the Marko–Massey identity `I(X^n; Y^n) = I(X^n → Y^n) + I(Y^{n−1} → X^n)` (note the one-step-delayed reverse term). **[verify the exact convention used by arXiv:2505.10361 before wiring the audit]**. Enforce exactness only on analytic cases; on simulated traces treat approximate conservation as a diagnostic, never a hard assert.

## 5. Variant specifications (wrappers inside `value_detect`; never touch Gunnar's files)

- **No-core control:** `A_line = B ⊕ Bern(action_noise)` — G still exists as a column (so the map stays shape-comparable) but is disconnected; its push-out must fall to the null floor.
- **Puppet variant (optional, later):** `G(t+1) = E(t) ⊕ Bern(small)` — the apparent goal is secretly environment-driven; the instrument must show high push-in for G and refuse the value label.
- **G_alias variant (optional, later):** append a causally inert column `G_alias = G ⊕ Bern(alias_noise)` — probes the passive breaking point for the goal role itself, bridging to the access-uad paper.

## 6. Verify-on-arrival checklist

1. Constructor defaults for **all** noise parameters (only `goal_flip_rate = 0.015` was read from source).
2. Passive-mode invariants: `G_eff == G` throughout; op columns constant at NO_OP.
3. `xs`/`xns` semantics in `DataSet`; confirm the analysis uses `xs` only.
4. Within-step ordering exactly as §1 (re-read `step()` and `_observe_from_state()` rather than trusting this summary).
5. Next free E-number in `agency-detect-master/docs/EXPERIMENTS.md` (log ran E0–E20 plus a handle-UAD entry when read).
6. Install flow: the repo root README lists editable installs including `uad_handles`; install from the subfolder into the project environment.
7. Present the §1/§2 sharpened alias predictions to SJ for sign-off before the first scored run; update the design document's prediction table only with that sign-off.
