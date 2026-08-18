# Unsupervised Value Discovery — Design Document (v1)

**Project:** Unsupervised value discovery inside agents, extending Gunnar Zarncke's Unsupervised Agent Discovery (UAD)
**People:** SJ Beard (project lead; philosopher and existential-risk researcher, PIBBSS fellow) · Gunnar Zarncke (mentor; author of this repository and of *Towards Superintelligence Alignment*) · Claude (implementation and analysis)
**Status:** Agreed design, ready to build. Drafted in Claude chat on 7 Aug 2026 and handed over to Claude Code together with a companion file, `TECHNICAL_ADDENDUM.md`.
**Project layout:** the Claude Code working folder is SJ's project folder ("agency project"). Gunnar's repository sits inside it as the subfolder `agency-detect-master/` and is **read-only by project policy — never edit, add, or delete anything inside it**. Everything we build lives at the project root alongside it. Save this file and the addendum at the project root.
**If this document and Gunnar's repository disagree** (paths, experiment numbering, code behaviour), trust the repository and flag the discrepancy to SJ.

---

## 0. How to work with SJ — read this first

- SJ has a philosophy PhD and several years in AI safety. Philosophical and AI/ML jargon is fine.
- SJ does not read code or mathematical notation. **All communication in plain English.** Code lives in files; explain what it does and what results mean in words. Section 7 of this document and the companion `TECHNICAL_ADDENDUM.md` are the only parts written for the implementing Claude rather than for humans.
- Work **step-by-step from this agreed plan, in small chunks** (this also manages usage limits). At the end of each chunk, give a plain-English summary and get SJ's sign-off before starting the next. Do not run ahead.
- Surface assumptions explicitly; where several reasonable options exist, present them rather than choosing silently. (This also matches the AGENTS.md rules inside Gunnar's repo, which we adopt for our own work too.)
- Verification is designed so SJ can audit the work without reading code — see the three levels in §6.
- Suggested first action on receiving this document: save it and `TECHNICAL_ADDENDUM.md` at the project root, read `agency-detect-master/AGENTS.md` and `agency-detect-master/PROJECT_INSTRUCTIONS.md` (they are in a subfolder, so they are not auto-loaded — read them explicitly), optionally create a short `CLAUDE.md` at the project root pointing to both documents so future sessions load them automatically, then re-summarise the whole plan to SJ in plain English and wait for the go-ahead.

## 1. What this project is

Gunnar's UAD finds **agents** in raw time-series data: sets of variables that maintain a boundary (an approximate Markov blanket) with their environment. This project extends the same unsupervised, plant-and-recover style of experiment one level inward: finding **value-like structure inside an agent**. The claim under test is that values have a distinctive *directional* signature — they are the parts of a system that most strongly **drive** what happens around them while being least **driven** in return — and that this signature can be read out of passive observational data alone, without labels, interventions, or any prior definition of what a value is.

Purpose and stakes: the immediate goal is a concrete, runnable demonstration of SJ's theoretical idea, primarily as a communication artifact for Gunnar, who has expressed strong interest. The project is deliberately low-stakes and exploratory: a clean success helps SJ and Gunnar move forward; a partial result or informative failure still shows Gunnar where SJ wants to go. Be bold, and report honestly.

## 2. Theoretical background (plain English)

**Gunnar's UAD.** Simulated machines act in a shared world; everything is recorded as an unlabeled table of numbers over time; the algorithm then recovers which variables form agents by testing candidate groupings for the blanket property (once you know a group's sensors and actions, its insides and the outside world become nearly independent), using conditional mutual information against a leakage tolerance ε. Gunnar's own gloss, paraphrased: there are no true Markov blankets — all real boundaries leak, and must leak for the agent to learn and communicate — so a blanket is an ideal an agent *tries* to achieve, and we work with blankets up to an ε of mutual information. The same spirit applies to this project: no subsystem is purely a value or purely a belief; we are looking for systems that *push* subsystems toward those poles.

**The empowerment/plasticity trade-off.** The paper *Plasticity as the mirror of empowerment* (arXiv:2505.10361) defines, for any chosen boundary, two directed quantities over an agent's interaction history: **empowerment** (how much the inside's past shapes the outside's future — "push-out") and **plasticity** (how much the outside's past shapes the inside's future — "push-in"). Two results matter here. First, a decomposition: the total coupling between inside and outside splits exactly into these two directed pieces. Second, a tension: over any single boundary the two compete for a bounded budget — pushing one up squeezes the room for the other. You cannot be maximally empowered and maximally plastic across the same boundary at once.

**SJ's theory (the background claim).** Because of that tension, an adaptive system has a reason to **specialise internally**: to separate out some subsystems that are as plastic as possible (belief-like states, highly sensitive to the environment) and others that are as empowered and protected as possible (value/desire-like states that shape behaviour and resist being reshaped), thereby minimising interference between inbound and outbound information flows. The system as a whole keeps a balance of empowerment and plasticity, but its parts skew toward the poles — with decision-making machinery in between drawing on both. This division of labour lets a system retain a core function that helps it self-propagate while staying adaptable and resilient, making such architectures more likely to be selected for over the long term — and providing the basis for more complex capacities later. On this view, what we call agency (or at least intentionality in Dennett's sense) may partly *be* this strategy.

**What "values" means operationally here.** The value-pole parts are whatever the system most wants driving its environment and least wants the environment driving in return. Three consequences shape the design:
- A **frozen** value is statistically invisible (a constant carries no information) — and is anyway closer to hardwiring than to a value. The value-core must change *occasionally*.
- But its changes must come **only from an internal process**, never from the environment. Self-driven update is not plasticity; environmental capture is. Keeping these separate is the single most important modelling decision.
- Rare change is statistically **expensive**: you need to witness many changes to measure anything about them, which means long runs. (Gunnar hit the same issue — rarely-changing variables were his hardest classification cases.)

**Methodological stance.** This is deliberately *unsupervised value discovery*: find the parts of a system that are driving it toward particular environmental states, then interpret what they are and how they work afterwards. Do not start from a richer prior theory of value and go hunting for it. The directional signature above is the entire prior.

**A calibration example to keep in mind (SJ's).** Ask which part of a human is most empowered and least plastic *relative to the whole organism* and the answer is DNA — it changes very little and shapes a great deal. But DNA is arguably not the most empowered part *relative to the environment*: identical twins with different goals shape the world very differently. This is why push-out is computed in two flavours (toward the rest of the system, and toward the environment only): a DNA-like part scores high on the first and drops on the second; a goal-like part stays high on both. Report both.

## 3. What v1 tests — and what it does not

**This is an instrument test, not yet a test of the theory.** We are building a thermometer and checking it reads correctly on objects whose temperature we already know. Whether real or evolved systems spontaneously *develop* the predicted polarisation is the deeper claim, and it is a *follow-up* experiment that this instrument makes possible.

**Operational hypothesis (v1).** In Gunnar's handle-world (§4), ranking variables passively by "push-out minus push-in" places the planted goal variable G at the drive pole and the planted belief variable B at the intake pole; matched control systems with no planted core show no comparable pole.

**Falsification conditions.** The operationalisation fails if the method cannot recover structure we know is there, or if it "finds" value-poles in control systems built without any. Either failure is a real and reportable result.

**Explicit non-goals for v1:** solving the alias/lookalike ambiguity (that is the subject of Gunnar's access-model UAD paper — see §5); richer or evolved worlds; real data; interventions of any kind (v1 is purely passive).

## 4. The v1 world — Gunnar's handle-world, used exactly as-is

**Decision (SJ, 7 Aug 2026):** v1 uses the existing toy world in `agency-detect-master/uad_handles/src/uad_handles/minimal.py` (class `SyntheticHandleWorld`), with **passive rollouts only** (no handle operations). A richer custom world remains an open option for later versions. Import and wrap this world; do not copy or modify it.

**Why this world.** It contains, almost line for line, the structure this project's design specified independently: a belief pole, an internally-driven goal, a decision rule combining them, an environment loop, and decoys. It was built by Gunnar *before* this project existed, for a different question (his handles paper) — so nobody can suggest the world was designed to flatter the measure. And it is maximally legible to Gunnar. Note honestly: the implementing-Claude-in-chat has read this world's source code, so the protocol is not blind; protection comes from the world's independent origin, the controls, and multi-seed runs.

**The nine observed binary variables** (observation vector order: B, S, A, E, G, S_alias, A_alias, D, W):

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

Useful facts: all nine variables are directly observed (G included — realistic hiddenness is future work); the world's causal structure is lag-1 by construction; aliases exist for S and A but **not** for G, so the alias problem does not bite the B-vs-G headline in v1; at ~1.5% flip rate, a 2,000-step run sees roughly 30 goal flips — run lengths of 2k–20k steps are appropriate and cheap for nine binary variables.

**The headline result is the two-item claim (G above B on the asymmetry ranking) plus the full nine-variable map**, which is the richer demonstration: each variable landing where the table predicts.

## 5. Relation to Gunnar's work (for the writeup, and for talking with Gunnar)

- **Versus his goal-discovery sketch.** Gunnar's UAD post sketches reading off a discovered agent's goals via inverse reinforcement learning — assume a reward-maximiser, infer the reward. This project is the deliberate alternative: a *structural, non-reward-maximiser* route to the same territory, which never presupposes that values take the form of a reward function. That is the niche.
- **Versus his access-model UAD ("handles") paper** (`docs/papers/access-uad/`, which the v1 world was built for). The paper argues passive observation is fundamentally limited — lookalike variables can fool any passive method — so role identification needs small embedded interventions ("handle operations": `sensor_flip`, `action_block`, `goal_flip`). His interventional goal test is: flip the candidate goal and see whether the action changes given belief and environment. **Our measure is the passive counterpart of exactly that test.** The project's sharpest framing: *how far can passive directional structure get toward what the goal-flip intervention establishes — and where precisely does it break?* The expected apparent drive of A_alias is a feature here, not an embarrassment: it displays the boundary between what passive methods can and cannot do, connecting this work directly to his paper. A natural joint follow-up he will appreciate: add an alias *of the goal* and map the breaking point.
- **The contrast case from his older simulator.** In `agency_detect/src/agency_detect/agents.py`, the variable literally named `goal_progress` is a *progress meter*: it rises as a consequence of actions taken and the decision rule never consults it. Our measure should **reject** it (all intake, no drive) while **accepting** G in the handle-world. "The variable your first sim calls a goal is not a value on this measure; this other one is, and here is the signature" — run this as part of the controls (§6). It is the crispest possible demonstration of what the theory adds, built entirely from Gunnar's own artifacts.
- **House conventions that support this project.** His existing classifier already works by percentile *rankings* rather than absolute thresholds, so the ranking-first approach below matches repo practice. His blanket tolerance is ε = 1.0 nats; his estimator conventions are in §7. His experiment log runs E0–E20 plus a handle-UAD entry; this project writes a drop-in-ready entry for the next free number, kept in our own folder since his repo stays unmodified (see §7).
- **A small quirk to pass on when convenient** (harmless): in the older simulator, several "dynamic" decision thresholds are sinusoids of a quantity that never changes (the fixed memory length), so the intended time-variation silently does not happen. Agent-specific offsets still differ, so his results stand; he may simply want to know.

## 6. Method

**Shape: plant-and-recover, with controls.** Generate long passive traces from the world; compute directional scores for every variable; present rankings and a two-axis map; compare against the ground-truth predictions in §4; run the controls; repeat across many seeds.

**The directional score, in words.** For each variable: **push-in** is how much the past of everything else tells you about that variable's next step, beyond what the variable itself already tells you. **Push-out** is how much that variable's past tells you about the next step of everything else, beyond what everything-else already tells you. Compute push-out in two flavours — toward the rest of the whole system, and toward the environment side only (§2, DNA example). The **asymmetry score is push-out minus push-in**; the primary outputs are the **ranking** by asymmetry and the **two-axis map** (intake on one axis, output on the other, one point per variable). No hard threshold is part of any primary claim.

**Noise floors instead of hand-picked thresholds** (the answer to a fair robustness concern raised by SJ's colleague Chris Pang: every added knob risks making results an artifact of where the knobs sit). Every score is compared against a floor computed from deliberately broken versions of the same data — e.g., circularly time-shifting one variable against the rest, which preserves each variable's own statistics while destroying genuine cross-timing. "How strong is strong enough" is then answered by the data. Mirror the null-model conventions in `uad_worm/src/uad_worm/nulls.py`. Where sweeps over settings are run (lags, run lengths, estimator smoothing), report the stability range honestly — "solid here, fragile there" is itself a finding, and is the direct answer to Chris.

**Controls (all pre-committed):**
1. **No-core variant:** same world with G disconnected (action depends on belief only). Must show no drive pole above the noise floor.
2. **Scrambled data:** full time-shuffle. Must show nothing anywhere.
3. **The `goal_progress` contrast case** (§5): run the older simulator, score its variables; `goal_progress` must land as intake-heavy, not value-like.
4. *(Optional, later)* **Puppet variant:** a goal secretly driven by the environment. A good instrument must *refuse* to call it a value — its push-in gives it away. Connects to the manipulation/value-capture themes in Gunnar's book.
5. *(Optional, later)* **G_alias variant:** the breaking-point experiment bridging to the handles paper.

**Pre-registered success criteria** (working figures — finalise numbers with SJ before the first full run, and do not adjust after):
- G tops the asymmetry ranking in ≥ 80% of ≥ 20 seeds (and B vs G specifically: G above B in ≥ 90%).
- B tops the intake ranking among the true loop variables in a comparable majority.
- The no-core control shows no variable above the noise floor on asymmetry in ≥ 80% of seeds.
- The headline ordering holds across run lengths {2k, 5k, 20k} and analysis lags {1, 2, 3}; the stability map is reported either way.

**Three-level verification:**
- **Level 1 — code-facing unit tests** against provable answers, before trusting anything downstream: a variable that copies another scores exactly one bit of directed flow; independent coin-flips score zero (within smoothing bias); a one-way chain shows flow in one direction and none back; and on analytic cases the two directed pieces sum to the total coupling (the paper's decomposition), giving measurements a built-in audit. Include an estimator-bias check against sample size.
- **Level 2 — SJ-facing plain-English artifacts** from every component: a *story printout* (a few dozen timesteps narrated in words: "environment flipped; sensor caught it; belief updated; goal unchanged; action followed belief-and-goal; environment responded") so SJ can confirm the world behaves as §4 describes; the two-axis map with variable names; a how-often-each-variable-changes chart; and a short plain-English results memo per run. If the story reads wrong to SJ, the build is wrong regardless of passing unit tests.
- **Level 3 — the pre-registered experiment-level criteria above.**

## 7. Technical specification (for the implementing Claude)

Read together with `TECHNICAL_ADDENDUM.md`, which carries the formal detail: the world's exact update equations as read from source, the estimand menu with cardinality arithmetic, analytic unit-test targets, variant specifications, and a verify-on-arrival checklist.

- **Estimators:** discrete plug-in MI/CMI with Laplace smoothing, matching `agency_detect/src/agency_detect/markov_blanket.py` conventions (α = 0.1, natural log/nats). Multi-variable conditioning via state-tupling explodes cardinality — keep conditioning sets small (≤ 2 variables where possible) and prefer aggregate "rest" summaries; sample sizes must respect this.
- **Directed measures:** transfer-entropy-style. Working definitions: push-in(X) = I(X_{t+1}; Rest_t | X_t); push-out(X) = I(Rest_{t+1}; X_t | Rest_t), with "Rest" instantiated per flavour (all-others; environment-side only). **Mediation warning:** do not condition on mediators when computing the environment flavour — G reaches E *through* A, and conditioning on A would screen off exactly the influence being measured. The precise conditioning choices (and any normalisation of the asymmetry score) are genuine open design decisions: write a short plain-English options memo for SJ at the start of Chunk 4 rather than choosing silently.
- **Lags:** the world is lag-1 by construction; lag-1 is primary, sweep to lag 3 (repo `MAX_LAG = 3`) for robustness reporting.
- **Conservation audit:** exact only on analytic cases; on simulated data treat push-out + push-in ≈ total coupling as a sanity diagnostic, not a hard assertion.
- **Package layout:** new standalone package `value_detect/` at the **project root**, a sibling of `agency-detect-master/`, with `src/`, `tests/`, `scripts/`, `pyproject.toml`, `README.md`, mirroring the house style of Gunnar's packages so the whole thing could later be dropped into a copy of his repo as a pull request. Install his packages from the subfolder in editable mode (at minimum `uad_handles` for the world, plus `agency_detect` for estimator reference) rather than copying code. Our artifacts go under our own `results/<experiment>/` at the project root. Instead of editing his `docs/EXPERIMENTS.md`, write a **drop-in-ready** experiment-log entry in his format (verify the next free E-number by reading his log; propose title "Unsupervised value discovery (directional UAD)") and save it in our own `docs/`, along with session summaries mirroring his `docs/conversations/` template. Report exact commands and key metrics, per his `PROJECT_INSTRUCTIONS.md`.
- **Reproducibility:** fixed seeds everywhere; multi-seed sweeps scripted; every figure regenerable from one command.
- **World usage:** passive rollouts via the existing `generate_passive` path (burn-in included); do not modify `uad_handles`; build variants (no-core, puppet, G_alias) as subclasses or parameterised wrappers inside `value_detect`, leaving Gunnar's files untouched.

## 8. Build plan — chunks and sign-off points

Each chunk ends with a plain-English summary to SJ and explicit sign-off before the next begins.

1. **Design lock.** This document. *(Done.)*
2. **Wrap the world.** Passive rollouts through `uad_handles`; the recorder; the story printout and change-frequency chart. SJ verifies the narrative matches §4 before anything is measured.
3. **Estimator core.** Directed-information tools plus the full Level-1 test suite; short plain-English test report to SJ.
4. **The directional scorer.** Options memo on conditioning/normalisation (see §7) → SJ picks → first ranking and two-axis map on the default seed → compare to the §4 prediction table.
5. **Controls and robustness.** No-core variant, scrambles and noise floors, the `goal_progress` contrast run, multi-seed sweep, lag/run-length/smoothing sweeps → the stability map. (Optional if time and results warrant: puppet variant; G_alias.)
6. **Interpret and write up.** Figure 1; the drop-in E-log entry in Gunnar's format; a plain-English memo for SJ's fellowship; limitations (aliases; soft-blind protocol; estimator caveats); the bridge to the handles paper; the follow-up list (richer world, hidden-G, evolved systems — toward the real question of whether polarisation *emerges*).

## 9. Open questions (flag at the relevant chunk, decide with SJ)

- Normalisation of the asymmetry score (raw difference vs scaled by total coupling) — Chunk 4 options memo.
- Exact "Rest" definitions per flavour, and the mediation handling — Chunk 4 options memo.
- Final success-criterion numbers — before the first full Chunk 5 run.
- Whether to run Gunnar's boundary-discovery stage on the trace at all in v1: with nine variables the agent boundary is known and tiny, so boundary-finding is a nice-to-have sanity check rather than a core stage (this is a deliberate simplification of the earlier six-chunk plan; the directional stage is where the novelty lives). Decide at Chunk 4.
- Whether `S_obs`/`A_obs` vs the aliases behave differently enough under noise to be separable passively — observe and report, no commitment.

## 10. Sources and references

- **Gunnar's repository (local copy at `agency-detect-master/` — all paths below are inside that subfolder):** `uad_handles/` (the v1 world), `agency_detect/` (estimator conventions; the contrast-case simulator), `uad_worm/src/uad_worm/nulls.py` (null-model conventions), `docs/EXPERIMENTS.md` (log format, E0–E20), `docs/papers/access-uad/` (the handles paper), `AGENTS.md` and `PROJECT_INSTRUCTIONS.md` (house rules — binding).
- Gunnar Zarncke, *Unsupervised Agent Discovery*, LessWrong: https://www.lesswrong.com/posts/pXYosC3eoS9GrDRAw/unsupervised-agent-discovery
- *Plasticity as the mirror of empowerment*, arXiv:2505.10361 — the trade-off and decomposition results underpinning §2.
- Krakauer, Bertschinger, Olbrich, Flack & Ay, *The information theory of individuality* — the outer-boundary ancestor of this project: recovering individuals (with nested partitions and grades of individuality) from time series alone.
- Klyubin, Polani & Nehaniv — empowerment as an agent-centric, task-free measure of control (channel capacity from actions to future sensor states).
- Context only (framing, not needed for the build): Gunnar's book *Towards Superintelligence Alignment* (per-chapter HTML under `towards-alignment.com/cards/chapters/chNN/`), especially Ch. 15 (values as compressed control signals), Ch. 32 (self-modeling and the selfhood bottleneck), Ch. 45 (legitimate value change); and SJ's standing interest in Bostrom/Omohundro on agents altering their own utility functions (the passive-vs-interventional value-identification question is a distant cousin of it — see also Everitt's self-modification work cited in the book's Ch. 44).
