# V2-1 options memo — fixing the floors (informed by the verified C3 mechanism)

Diagnosis (from stored chunk-5 data, `results/v2_1/C3_MECHANISM.md`, 2026-08-10):

- All 6 signature thefts were **Branch B** (net intake > 0; ratio met between tiny
  residuals); the "floor swallows intake" story from v1 was wrong and is retracted.
- All 6 thefts are `Steel1_goal`, a **near-frozen** variable (change rate ≈ 0.000): its
  scores sit at their floors on every axis, and with only a handful of transitions the
  floor estimate itself is unstable — gates fire on noise residuals well above the
  nominal 5%.
- The genuinely slow-but-alive meter (`Solar1_goal`, ~1.1% change rate) was correctly
  rejected in 20/20 seeds under both conventions. Slowness is handled; **frozen-ness is
  the degenerate case**.

## Option 1 — Calibration margins (z-gates) *(recommended primary)*

Keep circular-shift nulls. Strengthen the gates: a score counts as above floor only if
it exceeds its null's 95th percentile **and** clears the null mean by ≥ z_min null
standard deviations (proposed z_min = 3; applied to the drive gate and the rankability
gate; the ratio clause unchanged). Effect: hair-above-floor residuals of near-frozen
variables can never count (their whole excess is within ~1 null-sd), while every genuine
v1 signal passes by enormous margins (V1's G clears its fused floor by orders of
magnitude). Cheap: the floor engine already produces the samples; store mean/sd alongside
percentiles. z_min is pre-registered in V2-5 before any scored sweep.

## Option 2 — Transition-surrogate nulls (second null family)

Regenerate the candidate column from its own fitted one-step transition statistics
(preserves its dynamics; varies which/when transitions occur). Unlike rolls, surrogates
vary the *event pattern*, which may honestly widen the null's upper tail for low-activity
variables. More code and one modelling choice (surrogate order); slower than rolls.

## Option 3 — Both, decided by calibration

Implement Option 1; build Option 2 as a comparison; run both on the discriminating-pair
calibration world (a *slow genuine value* that must keep its signature + a *near-frozen
meter* and a *moving meter* that must never sign) plus scramble false-positive checks.
Adopt for V2 whatever the calibration results justify; report the comparison either way.

**Recommendation:** Option 3, with Option 1 expected to carry the fix and Option 2 kept
if (and only if) calibration shows it adds discrimination the z-gates miss.

Also proposed, independent of the option chosen: correct the v1 write-up's "blind spot
is slow meters" wording to "near-frozen variables" (memo + shipped bundle copy), since
the diagnosis retracts the original mechanism claim.
