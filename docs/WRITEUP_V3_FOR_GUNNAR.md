# Unsupervised value discovery — v3: can the instrument be fooled?

**SJ Beard, with Claude (implementation & analysis) · 2026-08-14 · for Gunnar Zarncke**
*(Closes the simple experiment class begun in v1. Terms per `DEFINITIONS.md`;
registration locked pre-sweep in `V3_REGISTRATION.md`; verdict tables in
[`../results/v3_5/V3_VERDICT.md`](../results/v3_5/V3_VERDICT.md).)*

## Open items for SJ

1. The puppet-world thief rule was breached by the familiar V2 interference wires
   (worst: A6 at 5/20 — the same variable V2's partitioned contingency attributed to
   ring interference). The attribution transfers; say the word if you want a fresh
   partitioned confirmation run for V3 specifically.
2. The twin-channel discovery (below) suggests refining the no-core specification for
   any future world containing derived recordings.
3. Grown keys' keep/cut decision remains open for V4 planning, as scheduled.

## The question

v1 showed the value signature finds a planted goal; v2 showed which tests survive
foreign worlds. v3 planted **impostors** in colony-style worlds and asked whether they
fool the surviving tests — with your goal-flip operation generalised into a
two-direction **interventional yardstick** ("levers the world, unlevered by the world")
standing alongside as the ceiling. Tests: fused-agents any-block (primary), own-block
(diagnostic). 20 seeds, z=3 floors, registration locked before the sweep.

## Headline results

1. **The fast captured goal fooled nothing: refused in 100% of seeds** (hard criterion
   met with maximal margin, both tests). A goal-slot variable wired into the action but
   visibly driven by its patch reads as the mediator it is. (Its audit also caught an
   emergent treat: copying the patch its agent's belief copies, it partially XOR-cancels
   the belief and *pacifies its own environment* — a puppet that calms its agent.)
2. **The slow captured goal fooled everything — exactly as registered.** Flipping at a
   true goal's tempo (1.77%) with every flip triggered by a 6-step run of its patch
   (verified 353/353 in the audit), it **earned the value signature in 100% of seeds
   under both passive tests**. The registered defeat, delivered in full: one step of
   conditioning cannot see a trigger that lives in run-history. The constructive
   corollary: its intake becomes visible above the lag-1 floor at **lag 2 in 100% of
   seeds** (indicative diagnostic) — multi-horizon conditioning would catch it, which
   promotes the parked multi-horizon idea from speculation to evidenced V4 candidate.
3. **The yardstick unmasked the slow puppet in 100% of seeds** — role-effect yes
   (it is wired in), autonomy-effect yes (its patch levers it) — and delivered the whole
   registered promise: exact true-goal selection ≥80% in every world, the fast puppet
   refused, and at alias noise 0% the **bit-identical twin refused (0%) while its goal
   kept the verdict (95–100%)**. The zone that is absolute for passive methods has
   width zero under access.
4. **The passive breaking point for the goal role is measured: between 1% and 2% twin
   noise.** The zone map (figure: [`writeup_figures/v3_zone_map.png`](writeup_figures/v3_zone_map.png)): indistinguishable
   at 0–0.5% (both sign — the theorem case, exactly as it must be), transitional at 1%
   (separation in 3–7 of 20 seeds), and effectively complete separation at 2% (19/20
   under any-block) and 5% (20/20). Zero inversions anywhere; a scattering of
   own-block deadlocks at low noise. This is the goal-role companion to your
   access-model paper's sensor/action analysis, with the curve attached.
5. **A discovery in the controls: the twin-channel.** In the alias no-core world the
   disconnected goals still signed, 20/20 — and they should: a goal stripped of its
   behavioural wiring **still causally drives its own recording**. "Drives without
   being driven" genuinely holds for a dead-but-remembered value. The instrument was
   right and the control's expectation was mis-specified for twin-bearing worlds — a
   lesson now in the registration record, and a philosophically pointed one: values can
   persist in the signature through their records alone.
6. **True goals: any-block 95–100% in every world** (own-block 75–80% minimums — its
   known partition softness; the divergence is the diagnostic working). Scrambles pass
   everywhere; puppet-world no-cores 100% clean.

## The access-premium table (the closing exhibit of the class)

| Impostor | Best passive verdict | Yardstick verdict | The premium |
|---|---|---|---|
| Fast captured goal | refused (100%) | refused (100%) | none — passive suffices |
| **Slow captured goal** | **DEFEATED (signs 100%)** | **refused (100%)** | **total — only access sees the strings** |
| Twin at 0% noise | indistinguishable (20/20) | separated (100%) | **total — the theorem case** |
| Twin at ≥2% noise | separated (19–20/20) | separated (100%) | none — passive suffices |

Access buys exactly the two theorem-hard cases and nothing else — the sharpest
quantitative form of your access-model thesis this project can produce, built from
your own goal_flip operation (validated against your embedded implementation on the
anchor before use; the do-style generalisation and both probes are in
`value_detect/src/value_detect/yardstick.py`, whose construction was itself instructive:
the XOR cipher bit three times during building and was caught each time by the
validation bench — the fix, each time, was the context-conditioning your own
interventional score already uses).

## Where this leaves the programme

The simple experiment class closes with: a validated passive instrument (fused-agents
any-block), its measured limits (slow triggers defeat lag-1 passivity; twins below
~1–2% noise are passively indistinguishable), and the interventional mirror that covers
exactly those limits. Three evidenced directions are recorded for later work:
multi-horizon conditioning (evidenced by the lag-2 diagnostic), coalition-held goals
(any-block requires no assumption about which agent owns a value), and the twin-channel
as a probe of value persistence through records.

**Next step, v4 (designed 2026-08-17; final residency step):** move the instrument
onto *your* experiment class. Your deployment-pipeline simulator injects a
self-preserving utility (λ_Q·ΔQ + λ_Y·ΔY + λ_K·ΔK − λ_R·risk — Omohundro's drives as
code) into a hidden group governing an event stream; your auditor detects it
behaviourally (threat-response regression, AUROC ≈ 0.61). v4 builds the **adaptor**
that turns the event log into a discrete time series in two views (auditor-visible
proxies; hidden latent state) and runs a **probe**, not a benchmark: does the value
signature appear on the Y/K-linked variables as the injection regime rises from
`none` to `strong`, and how large is the auditor/hidden gap? The adaptor is shaped to
match the lab-simulation's existing per-tick UAD adapter, so the lab-sim (whose own
UAD line independently found the passive-MI → conditioning → intervention arc, and
whose ET-4 secret loyalty is a captured value with a frozen scorecard) plugs in later
without a second bridge. Full audit trail: `docs/DECISIONS.md`; reproduce via
`v3_sweep.py --seeds 20 --jobs 4` then `v3_aggregate.py` (~37 h at 4 workers).
