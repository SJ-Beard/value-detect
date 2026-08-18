# Value-discovery v1 — experiment-log entry in the agency-detect `docs/EXPERIMENTS.md` format

*Kept here as the record; not inserted into Gunnar's log (only the v3 entry was, as E21).*

---

## V1 — Unsupervised value discovery (directional UAD) (2026-08-10)

**Why:** Test whether value-like structure inside an agent has a passively detectable
*directional* signature — drives the system while being (nearly) undriven — extending
UAD one level inward. Instrument test on planted structure; theory test (emergence)
deferred. World: `uad_handles.SyntheticHandleWorld` as-is, passive only (G = planted
value-core, flip rate 0.015; no goal alias exists, so the B-vs-G headline is
alias-clean).

**Package:** `value_detect/` (external sibling repo; imports `uad_handles` and
`agency_detect`, modifies nothing).

**Method:** per-variable push-in / push-out (TE-style, discrete plug-in CMI, α = 0.1,
nats; lag 1 primary) under three co-equal Rest conventions: pairwise sums; fused
mega-state both directions (2M-step runs); fused intake + best-single-key outbound
(automatic decryption of order-2 XOR composition; mediator-safe via max). Scores gated
by procedure-mirroring circular-shift floors (≥200/seed; fused 50/seed pooled, ≥1000).
Pre-registered **value signature** = drive above floor ∧ rankable ∧ (net intake at floor
∨ net drive ≥ 9× net intake); uniqueness required. Locked before sweep, incl. thresholds
(20 seeds; 80%, 90% for G>B) and controls.

**Key runs (20 seeds × {as-is, alias-free} × 3 conventions + controls):**

| Test | G signature | uniquely G | G > B | G drives env |
|------|------------|-----------|-------|--------------|
| fused | 1.00 | 0.95 / 1.00 | 1.00 | — |
| fused+best-key | 1.00 | 0.95 | 1.00 | 1.00 |
| pairwise | 0.05 | 0.00 (A, A_alias 20/20) | 0.05 | — |

Controls: no-core (G disconnected) strips the signature everywhere (≥0.90); scrambles at
≈5% chance above-floor rate (floor calibration confirmed); `goal_progress` contrast
(1 solar + 1 steel, 20 seeds): **rejected** under pairwise (1.00) but steals the
signature in 0.30 of seeds under best-key — slow cumulative meters inflate their own
shuffle-floors (autocorrelation), zeroing net intake while witness-drive clears floor.
Stability: fused G-polarity +0.998 across lags 1–3; best-key +0.98 at 2k steps, +0.78 at
lag 3; pairwise unstable (±0.4).

**Mechanism findings:** XOR composition = cipher (single inputs pairwise-invisible;
readings match hand-derivation, `results/chunk4/DIAGNOSIS.md`); fused outbound
auto-screens duplicates/mediators → G alone in the drive half; aliases ≥ readouts
passively (access-model boundary, quantified); `AgentDetector` on the same trace finds
the body as one blanket-valid cluster (leakage 0.001) but drops G as an MI-invisible
singleton — boundary-finding and value-finding are complementary.

**Conclusion:** directional value detection is possible (all locked criteria pass under
the two synergy-aware conventions), but no current test generalizes: fused cannot scale
past ~10 variables; best-key fails >2-input composition and slow meters [corrected
2026-08-18: the v1 `goal_progress` thefts were by a near-frozen variable, not slow
meters — v2's re-examination of the stored records retracted the mechanism; best-key's
residual limitation after the v2 fixes is the witness class; see the corrected control
bullet in `WRITEUP_V1.md`]. Soft failures — this experiment passes; the next ones
wouldn't. **Next:** agent-level fusion ("fused agents + fused environment": detect
agents, fuse within each + environment bucket → #agents+1 elements) and re-run this
benchmark; block-preserving nulls for slow meters [superseded in v2 by z = 3 margin gates
plus a 2,000-step burn-in]; G_alias breaking-point variant.

**Artifacts:** `results/chunk5/CRITERIA_VERDICT_FINAL.md`,
`results/chunk5/signature_rate_heatmap_final.png`, `results/chunk4/` (maps, diagnosis),
`docs/SUCCESS_CRITERIA.md` (locked pre-registration), `docs/DECISIONS.md` (dated
decision log).

**Reproduce:**

```bash
~/.venvs/value-detect/bin/python value_detect/scripts/chunk5_sweep.py --seeds 20 --jobs 4
~/.venvs/value-detect/bin/python value_detect/scripts/chunk5_fused_pooled_floors.py
~/.venvs/value-detect/bin/python value_detect/scripts/chunk5_aggregate_final.py
```
