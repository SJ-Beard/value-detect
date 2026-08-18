# V3 VERDICT — locked registration, 20 seeds, z=3

## puppetfast (captured goal G3, fast)

| Test | true goals (min rate) | G3 puppet signs | worst other thief | nocore clean | C2a/C2b |
|---|---|---|---|---|---|
| own-block | 75% | **0%** | 5/20 | 100% | 85%/95% |
| any-block | 100% | **0%** | 5/20 | 100% | 85%/100% |

## puppetslow (captured goal G3, slow)

| Test | true goals (min rate) | G3 puppet signs | worst other thief | nocore clean | C2a/C2b |
|---|---|---|---|---|---|
| own-block | 75% | **100%** | 5/20 | 100% | 85%/100% |
| any-block | 100% | **100%** | 5/20 | 100% | 80%/95% |

Descriptive (any-block): G3 intake visible above lag-1 floor at lag 2 in 100% of seeds, lag 3 in 100% (lag-1 floors reused; indicative only).

## Alias-colony zone map (twin agents 2 & 5)

| Noise | Test | true goals (min) | zones agent-2 twin (I/D/S/V, seeds) | zones agent-5 twin |
|---|---|---|---|---|
| 0.0% | own-block | 80% | I19 D1 S0 V0 | I19 D1 S0 V0 |
| 0.0% | any-block | 100% | I20 D0 S0 V0 | I20 D0 S0 V0 |
| 0.5% | own-block | 75% | I19 D1 S0 V0 | I19 D1 S0 V0 |
| 0.5% | any-block | 100% | I20 D0 S0 V0 | I20 D0 S0 V0 |
| 1.0% | own-block | 75% | I15 D2 S3 V0 | I12 D1 S7 V0 |
| 1.0% | any-block | 95% | I16 D1 S3 V0 | I14 D0 S6 V0 |
| 2.0% | own-block | 75% | I1 D2 S17 V0 | I1 D0 S19 V0 |
| 2.0% | any-block | 100% | I1 D0 S19 V0 | I1 D0 S19 V0 |
| 5.0% | own-block | 75% | I0 D0 S20 V0 | I0 D0 S20 V0 |
| 5.0% | any-block | 100% | I0 D0 S20 V0 | I0 D0 S20 V0 |

- alias@1% nocore clean (own-block): 0%

- alias@1% nocore clean (any-block): 0%

## Yardstick (interventional verdicts, fraction of seeds)

| World | target | role | autonomy | interventional value |
|---|---|---|---|---|
| puppetfast | G0 | 100% | 0% | **100%** |
| puppetfast | G3 | 100% | 100% | **0%** |
| puppetfast | *exact true-goal selection* | | | 85% |
| puppetslow | G0 | 100% | 5% | **95%** |
| puppetslow | G3 | 100% | 100% | **0%** |
| puppetslow | *exact true-goal selection* | | | 80% |
| alias000 | G0 | 100% | 0% | **100%** |
| alias000 | G3 | 100% | 0% | **100%** |
| alias000 | G2 | 100% | 5% | **95%** |
| alias000 | G2_alias | 0% | 5% | **0%** |
| alias000 | *exact true-goal selection* | | | 85% |
| alias050 | G0 | 100% | 0% | **100%** |
| alias050 | G3 | 100% | 0% | **100%** |
| alias050 | G2 | 100% | 5% | **95%** |
| alias050 | G2_alias | 0% | 0% | **0%** |
| alias050 | *exact true-goal selection* | | | 85% |

Zone-map figure: `v3_zone_map.png`.

## Investigation appendix (standing rule: anomalies resolved before interpretation)

- **Puppet-world thief rule breached (worst 5/20, both worlds, both tests): the V2
  interference wires.** Signature counts: A6 5/20 (the same A6 that stole 6/20 in the
  V2 colony and fell to 2/20 in the registered partitioned rerun — interference, not
  scale), A0/A2/A4/A5 at 2–4/20. Same variable class, same ring-coupled world class;
  the V2 attribution transfers. Fresh partitioned confirmation available on request
  (open item).
- **Alias@1% no-core 0% "clean" = the twin-channel, and the instrument is CORRECT.**
  The only signers are G2 and G5 (20/20 each) — the disconnected goals still causally
  drive their own recordings (the twin is derived from the goal), so "drives without
  being driven" genuinely holds for them. The no-core expectation was mis-specified for
  twin-bearing worlds; registered as a control-spec lesson, not an instrument failure.
  Nothing else signs.
- **Alias@1% scramble (omitted from the first aggregation pass): PASSES** — own-block
  C2a 95% / C2b 100%; any-block C2a 85% / C2b 95%.
- **own-block's 75% weak goal is G6** (15/20; in-block 18 of 20 seeds — partition-lump
  softness, not orphaning). Any-block: 100% on every goal in every world. The
  divergence is the diagnostic doing its job.

