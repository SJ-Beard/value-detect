# Chunk 4 options memo — decisions SJ makes before the first scored run

Written 2026-08-07, **before any directional score has been computed on the world**.
That timing is the point: these choices lock the pre-registration, so they cannot be
accused of being tuned to flatter the results. Nothing in this memo required running
the scorer; everything comes from the design, the verified world mechanics, and the
Chunk 3 estimator checks.

Four items: three decisions and one sign-off.

---

## Decision 1 — What counts as "everything else" when measuring a variable?

Push-in asks: how much does the past of *everything else* tell you about this variable's
next step? Push-out asks the mirror question. But "everything else" (eight variables)
can be handled three ways:

**Option A — one combined mega-state.** Fuse all eight other variables into a single
joint state and measure flow against that.
*For:* captures genuine joint effects (two variables mattering only in combination).
*Against:* 256 possible combined states makes the estimator data-hungry and bias-heavy;
only trustworthy at our longest runs (20,000 steps), and even then every reading carries
a large built-in inflation that differs by variable — awkward for a fair ranking.

**Option B — add up one-at-a-time flows.** Measure the flow between this variable and
each other variable separately, then sum the eight readings.
*For:* each reading is a tiny two-variable measurement — cheap, low-bias, trustworthy
even at 2,000 steps; this is also how rankings stay comparable across variables. In a
world like ours whose causal structure is a simple loop (verified in Chunk 2), little
genuine joint effect is being missed.
*Against:* near-duplicate variables get counted twice — e.g. the sensor and its
lookalike carry the same signal, so flows involving them are somewhat double-counted.
This inflates *both* push-in and push-out symmetrically, so rankings are gentler-affected
than absolute numbers.

**Option C — hand-chosen small sets.** For each variable, hand-pick one or two
conditioning variables.
*Against (decisive, in my view):* hand-picking per variable is exactly the
knob-turning your colleague Chris warned about — every choice is a place a skeptic can
say the result was sculpted. It also stops being "unsupervised" in spirit.

**Recommendation:** **Option B as the primary method** at all run lengths, with
**Option A computed once as a cross-check** at the 20,000-step run (agreement between
them is itself a robustness finding; disagreement gets reported honestly).
Option C not used.

**Fixed regardless (not open):** the *environment flavour* of push-out — "how much does
this variable drive the environment specifically" — is always a single clean two-variable
measurement against the environment, conditioning only on the environment's own past and
**never on the action**. Chunk 3 demonstrated why: controlling for the middle-man erases
exactly the flow we're measuring, and the goal reaches the environment through the action.
One technical note: for the environment variable itself this measurement is meaningless
(it would measure E driving E), so E is marked "not applicable" on that axis.

---

## Decision 2 — The headline number: how to score "drive minus intake"

Each variable ends up with two numbers: push-out and push-in. The ranking needs one
number per variable. Three candidates:

**Option 1 — raw difference** (push-out minus push-in, in nats).
*For:* simplest; keeps absolute magnitudes.
*Against — and this matters for us:* the goal changes only ~1.5% of the time, so all its
flows are small in absolute terms. A busy mediator like the action has large flows in both
directions; if its intake and drive don't cancel exactly, its raw difference could
mechanically outrank the goal's small-but-pure drive. The raw difference measures "biggest
net trader", not "most one-way".

**Option 2 — polarity ratio** (difference divided by the sum; ranges −1 to +1).
*For:* scale-free — it asks "of all the flow passing through this variable, what fraction
is outbound?" A variable that drives without being driven scores near +1 however small its
absolute flows; a pure absorber scores near −1; a balanced mediator scores near 0. This is
the arithmetic form of the theory's actual claim: values are the parts that *most strongly
drive while being least driven in return* — a statement about proportion, not tonnage.
It is also the natural x-axis companion to the two-axis map.
*Against:* for a variable with almost no flow at all (the pure-noise variable), the ratio
divides one tiny number by another and becomes meaningless — it must be shown together
with total flow, and the noise floors (Chunk 5) decide who has enough flow to be ranked
at all.

**Option 3 — significance-only score** (how many noise-floor widths above the shuffle
floor). Pure significance, loses all magnitude information; better as a *gate* than a
*ranking*.

**Recommendation:** **polarity as the primary ranking statistic**, with the **raw
difference always reported alongside**, and Option 3's floor-based significance arriving
in Chunk 5 as the gate for who counts as "above noise" at all. The two-axis map (intake
vs. output) is always produced either way, so no information is hidden by this choice.

**Transparency note:** the design document's working criterion said "G tops the asymmetry
ranking" with asymmetry as the raw difference, while explicitly leaving normalisation open
for this memo. Choosing polarity now, blind, *is* the completion of that pre-registration —
and the pre-registered criteria should be read with "asymmetry ranking" meaning the
polarity ranking, raw difference reported alongside. If SJ prefers raw as primary, that is
equally lockable today; what we must not do is decide after seeing the map.

---

## Decision 3 — Run Gunnar's boundary-discovery stage at all in v1?

His pipeline first *finds* the agent's boundary; only then would one score insides. In
this nine-variable world the boundary is known and tiny, and our novelty lives entirely
in the directional stage.

**Recommendation:** **skip it in v1.** Note it as a deliberate simplification in the
writeup ("boundary assumed known; boundary-discovery composes naturally as a future
front-end"). Running it adds a day of plumbing for a sanity check the change-frequency
and mechanism tables already partly provide.

---

## Sign-off 4 — Sharpened prediction table (pre-registered before any scoring)

Chunk 2's verification found the lookalike variables are **exact, noise-free copies** of
the causally effective signals (the world's dynamics literally reuse them as the drivers),
while the "real" sensor/action columns are noisy readouts of those same signals. That
sharpens two rows of the design's prediction table, and the sharpening must be registered
now, before scoring:

- **A_alias ≥ A** on the drive axis (the lookalike action will read *at least as
  driving* as the noisy action readout — expected, honest limitation of passive methods,
  and the bridge to Gunnar's handles paper).
- **S_alias ≥ S** on the intake axis (same logic on the sensing side).
- Everything else in the §4 table stands unchanged; in particular the headline
  prediction — **G at the drive pole, B at the intake pole** — is untouched because the
  goal has no lookalike in this world.
- **D (distractor) timing quirk, restated:** D is driven by the *same-step* environment,
  so under our lag-1 measurement its reading may land anywhere from intake-heavy to
  near-null. Pre-registered stance: observe and report, no commitment.

---

## What happens after SJ decides

With picks on 1–3 and sign-off on 4, Chunk 4 proceeds: compute both flavours of push-out
plus push-in for all nine variables on the default seed, produce the ranking and the
two-axis map, and lay them beside the prediction table. No success criteria are evaluated
in Chunk 4 (that is Chunk 5's job, after the floors exist); Chunk 4 answers "does the
first picture look like the predicted picture?"
