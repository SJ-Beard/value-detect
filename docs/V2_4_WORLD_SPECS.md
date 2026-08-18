# V2-4 world specifications (proposed 2026-08-11, pending SJ approval)

Three worlds, all in our own package (modelled on the handle-world's mechanics; Gunnar's
repo untouched). Each ships its Chunk-2-style audit BEFORE any scoring — story printout,
change-frequency chart, mechanism-agreement table, pre-registered per-variable
prediction table — and SJ signs off each audit before instruments touch it.

## World A — Colony (Gunnar-scale multi-agent)

N = 8 handle-world-style agents (~50 variables), each with its own planted value-core
G_i (flip rate 1.5%), belief, sensor(+alias-free by default — lookalikes were a V1
device), action, distractor, own environment patch E_i; one global noise variable W.
Ground truth: every G_i — and nothing else — carries the signature within its agent's
context. This world also records the fused convention's "cannot run at scale" as a
result, and is the primary venue for SJ's witness-recurrence watch (does meter-type
interference decline at scale?) and the parity-gap diagnostic.

**The one open design choice — environment coupling:**
- **(1) Partitioned (recommended):** each agent drives only its own E_i; agents are
  causally independent. Cleanest ground truth at scale — any failure attributes to
  *scale alone*, not to coupling. Minimal-deviation choice; coupling becomes a V3
  variable if wanted.
- (2) Weak ring coupling: each E_i weakly influenced by a neighbour's action
  (Gunnar-style interaction). More ecological, but failures become ambiguous between
  scale and interference — two variables moved at once.

## World B — Deep synergy (dual composition, per the V2-2 decision)

One world, two agents (~15 variables), both with properly *driven* beliefs (the V2-3
toy-world lesson: undriven beliefs are themselves uncaused drivers):
- **Agent P (parity):** two environment channels E1, E2 (each driven by the agent's
  action), two sensors, two beliefs tracking them; action = B1 ⊕ B2 ⊕ G_P. Registered:
  best-key and grown keys blind on G_P's grip (the plateau); fused and both block
  architectures see it.
- **Agent M (majority):** same wiring; action = majority(B1, B2, G_M). Registered:
  grown keys strongest here; everyone sees something.
Ground truth: G_P and G_M carry the signature; the parity-gap column localises the
cliff empirically.

## World C — Slow-meter-rich

The V1 loop with its goal slowed (flip rate 0.5%) plus a battery of derived meters at
several timescales: a fast integrator, the 8-step-streak meter, a 32-step-streak meter,
and a saturating near-frozen meter — every meter a causally inert witness (the
`goal_progress` pattern). Ground truth: the slow G alone carries the signature; every
meter is refused; the z=3 tripwire columns report each meter's theft rate (SJ's
expectation: ≈0 here, and *declining* with world size across A/B/C).

## Audit gate

Each world: generator + fixed-seed traces + audit artifacts → SJ reviews the three
stories and prediction tables → sign-off → only then V2-5 (final pre-registration and
the full sweep: 4 qualified tests + best-key and fused as V1 holdovers, feasibility
permitting, × 4 worlds × controls).
