# V2-5 pre-registration — the V2 benchmark (LOCKED 2026-08-11, SJ)

**Locked before the sweep; nothing below changes after this point.** Everything
inherits the V2-1 floor standard (circular-shift nulls, z = 3 margin gates, harness
hygiene) and the locked signature definition (net-ratio 9×, V1 registration + amendments).

## Tests and feasibility (six tests; the map is part of the registration)

| Test | Anchor (V1 world) | Colony (49v) | Deep-synergy (17v) | Slow-meter (14v) |
|---|---|---|---|---|
| fused (V1 holdover) | runs (2M steps) | **infeasible** | **infeasible** | **infeasible** |
| fused + best-key (V1 holdover) | runs | runs | runs | runs |
| grown keys (k=2) | runs | runs | runs | runs |
| blocks: key-ring | runs | runs | runs | runs |
| blocks: menu | runs | runs | runs | runs |
| pairwise | dropped after V1 (structural blindness, documented) | — | — | — |

Fused's infeasibility beyond ~10 variables is a **recorded result** (its scale wall,
demonstrated), not a blank. Its parity-cracking duty in the deep-synergy world falls to
the block architectures (which qualified for exactly this).

## Settings

20 seeds; lag 1; 20k steps everywhere (fused's anchor runs at 2M as in V1). Floors: 200
shifts/seed, except (compute-bounded, registered): colony best-key and grown keys at 25
shifts/seed **pooled across seeds** (≥500 pooled samples per score — the V1 fused
pooling precedent); anchor fused reuses the V1 pooled floors spec. Estimated total
compute: roughly overnight (~8–11 h at 4 workers), dominated by colony key-based floors.
Environment flavour (T1) is evaluated only where registered in V1: anchor best-key.

## Criteria (thresholds ≥80% of seeds; G-above-B family ≥90%)

**Anchor:** exactly the V1 criteria (V1/V2/U1/U2 (+T1 best-key), C1, C2) at z=3 — the
regression baseline.

**Colony (per-agent analogues):**
- CV1: every G_i earns the signature in ≥80% of seeds (each of the eight, individually).
- CV2 (uniqueness, multiple-comparison honest): no non-goal variable holds the signature
  in more than 2/20 seeds (tolerates the designed ~5% chance-blip rate; catches
  systematic thieves).
- CU1: G_i above B_i on polarity in ≥90% of agent-seed pairs; CU2: B_i is its agent's
  max-intake member in ≥80% of agent-seed pairs.
- Controls: no-core (all goals disconnected) — no goal signs in >2/20 seeds, per-seed
  all-clean ≥80%; scramble — C2a/C2b as V1.

**Deep-synergy:**
- DS1: G_M signs ≥80% of seeds in EVERY test; G_P signs ≥80% in the block tests
  (registered expected-fail for best-key and grown keys on G_P — the plateau; their G_P
  rates are reported as the measured cliff, not counted against them).
- DS2: no non-goal variable >2/20 seeds. Controls as above (no-core = goals leave both
  rules). The **parity-gap column** (block-family reading minus grown-keys reading, per
  flow) is a standing report: large for agent P, ≈0 for agent M.

**Slow-meter:**
- SM1: G (at 0.5% flip rate) signs ≥80% of seeds in every test.
- SM2: no meter (M_fast, M8, M32, F_sat) holds the signature in >2/20 seeds; per-meter
  theft rates are the **witness-watch tripwire** (SJ's registered expectation: ≈0, and
  declining with world complexity across worlds).
- Controls as above (no-core = NoCore world at 0.5%).

## Block-test partition rules (fixed pre-lock, from colony pilot evidence)

- Swept detection selects the dial by **viable coverage**: a block counts only if the
  registered top-64 compression keeps ≥90% of its mass (lost < 10%); ties → MORE
  clusters (Gunnar's E12 anti-giant-component precedent). Plain coverage preferred
  32-variable lumps whose compression would carry ~nothing — the pilot log is in the
  decisions record.
- The **environment is never fused** (SJ, final): agent-blocks respect a *discovered*
  coherence — the point of agent discovery is systems that maintain themselves — while
  the environment as a whole has no such coherence to respect. A consistent rule also
  beats one that could fuse in some runs and not others. Env members are singleton
  elements with no conditioning ring, exactly like orphans.
- Colony pilot honesty note: at this scale his detector returns imperfect partitions
  (agents paired; on seed 0 a cluster of three *goals* validates as an "agent" —
  internals-only clusters pass blanket tests trivially). This is the registered
  measurement reality: **key-ring is expected to depend on partition quality; menu to
  be robust to it** — the architecture comparison is designed to measure exactly this,
  and per-world dial/coverage/G-placement columns document it.

## Standing diagnostic columns (reported every world, no pass/fail)

Witness-watch theft rates; parity gap; detection dial + valid-coverage + G-placement
(block tests); compression lost-mass; per-world runtimes.

## Interpretation rules (fixed in advance)

- A test failing where its blind spot was registered (best-key/grown on G_P) is the
  measured cliff, not an instrument failure.
- **Any colony failure triggers the pre-registered partitioned rerun** (coupling=0) for
  the affected criteria: persists ⇒ scale; vanishes ⇒ interference (SJ's attribution
  design).
- Witness-watch INCREASING with world complexity ⇒ stop and investigate before any
  further interpretation (SJ's tripwire).
- After the verdict: the **prune review** (SJ's standing commitment) — cut the
  architecture/convention grid before V3.
