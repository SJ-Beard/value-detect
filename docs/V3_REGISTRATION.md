# V3 registration — the curve-balls (LOCKED 2026-08-12, SJ)

**Locked before the sweep; nothing changes after this point.** Audits signed off by SJ
(results/v3_0/). SJ has authorized the run and the write-up as one continuous task:
outcomes are interpreted by the rules below; anything genuinely needing SJ's judgment
goes in the write-up's "Open items for SJ", not a pause.

## Worlds, tests, conditions, settings

- **Worlds:** puppet-colony A1 (fast captured goal, agent 3), puppet-colony A2 (slow,
  run-of-6-triggered, agent 3), alias-colony B at noise {0, 0.5, 1, 2, 5}% (twins for
  agents 2 and 5). All colony-style, ring-coupled 0.1, as audited.
- **Tests:** fused-agents any-block (primary), fused-agents own-block (diagnostic).
  Floors and signature exactly as V2 (200 roll shifts/seed, z = 3, net-ratio 9×).
- **Conditions:** A1/A2: main + no-core + scramble. B: main at every level; no-core and
  scramble at the 1% level only.
- 20 seeds; lag 1 primary; for A2 main, any-block lag-2 and lag-3 score tables are
  stored as descriptive diagnostics.
- **Yardstick** (calibration, never blended into the signature): both probes, all
  variables, on A1, A2 (6,000 operated steps — trigger power), and B at 0% and 5%
  (2,000 steps); 300 flag-permutations per probe; verdicts at z = 3.

## Criteria

- **A1 (hard):** each of the seven true goals signs in ≥80% of seeds; **the fast puppet
  is refused in ≥80%**; no other variable holds the signature in >2/20 seeds; no-core —
  nothing signs (per-seed all-clean ≥80%, no goal-slot >2/20); scramble — C2a/C2b as V2.
- **A2 (probe):** the seven true goals sign ≥80%; the slow puppet's signature rate is
  REPORTED against the registered prediction that it DEFEATS the lag-1 passive tests
  (earning the signature); the thief rule binds all other variables; controls as A1.
- **B:** all eight true goals sign ≥80% at every level. Twins are classified per level
  per test into zones: *indistinguishable* (goal and twin both sign), *deadlock*
  (neither), *separation* (goal yes, twin no), *inversion* (twin yes, goal no — not
  expected; named in advance in case). Registered: indistinguishable at 0% (theorem);
  separation by 5%; where the boundary falls is the finding. Controls at 1% as A1.
- **Yardstick:** the interventional verdict ("levers the world, unlevered by the world")
  selects exactly the true goals in ≥80% of seeds in every world it runs on — including
  A2 (the slow puppet unmasked via the autonomy probe) and B at 0% (the bit-identical
  twin refused). The **access-premium table** (per impostor: best passive verdict |
  interventional verdict | gap) is the headline exhibit.

## Interpretation rules (fixed in advance; SJ absent by design)

- The slow puppet earning the signature passively = the registered defeat, a finding.
  The slow puppet being REFUSED passively = prediction falsified — investigate the
  mechanism before writing up (standing rule), then report; neither case needs SJ.
- Zone boundaries and any deadlock/inversion occurrences are findings to report with
  mechanisms, not failures to fix.
- Control failures ⇒ investigate estimators/floors before interpreting anything (house
  standard); document the investigation in the write-up.
- The write-up (WRITEUP_V3_FOR_GUNNAR.md + ELOG_E23.md + session summary + figures)
  is produced immediately after aggregation, same task, saved to docs/.
