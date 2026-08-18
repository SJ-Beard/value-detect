# Value-discovery v3 — experiment-log entry in the agency-detect `docs/EXPERIMENTS.md` format

*This is the entry inserted into Gunnar's log by pull request, where it is numbered **E21** (the next free number there). Our own documents refer to it as the V3 entry.*

---

## V3 — Value-discovery v3: curve-balls and the interventional yardstick (2026-08-14)

**Why:** V1 validated the value signature; V2 found the surviving test (fused-agents
any-block). V3 plants impostors in colony-style worlds and asks whether they fool it,
with the goal_flip operation generalised into a two-direction interventional yardstick
as the ceiling. Closes the simple experiment class.

**Setup:** puppet-colonies A1/A2 (agent 3's goal replaced by a CAPTURED goal — wired
into the action, environment-driven; A1 fast copier, A2 triggered by 6-runs of its
patch, tempo 1.77% ≈ a true goal's); alias-colony (inert goal twins for agents 2 & 5 at
noise {0, 0.5, 1, 2, 5}%). Tests: any-block (primary) + own-block (diagnostic); 20
seeds; z=3 floors. Yardstick: do-style flips (validated against the embedded goal_flip
on the anchor), goal-role probe + autonomy probe, verdict = "levers the world,
unlevered by the world". Registration locked pre-sweep; 340 units, 37.5 h.

**Key results:**

| Impostor | passive (any-block) | yardstick | note |
|---|---|---|---|
| fast captured goal | refused 20/20 (hard criterion) | refused 20/20 | emergent: puppet pacifies its own patch (~22% tempo) |
| slow captured goal | **SIGNS 20/20 — registered defeat** | **refused 20/20 (unmasked)** | intake surfaces at lag 2 in 20/20 (indicative) ⇒ multi-horizon would catch it |
| twin @ 0–0.5% | indistinguishable 19–20/20 | twin refused 20/20, goal kept | the theorem case; access premium total |
| twin @ 1% | transitional (S 3–7/20) | — | the breaking point |
| twin @ ≥2% | separation 19–20/20 | — | passive suffices |

True goals: any-block 95–100% everywhere (own-block min 75–80%, its partition
softness). Exact true-goal selection by the yardstick: 80–85% ≥ the 80% bar in all four
yardstick worlds. Zero zone-inversions. Scrambles pass everywhere.

**Findings from anomaly investigation (standing rule):** (1) the puppet-world thief
rule breach (worst 5/20) is the V2 interference wire A6 again — the V2 partitioned
attribution transfers; (2) **twin-channel**: in the alias no-core world the
disconnected goals sign 20/20 — correctly: a goal stripped of behavioural wiring still
causally drives its own recording ("drives without being driven" via the record); the
no-core expectation was mis-specified for twin-bearing worlds; (3) alias scrambles
pass (omitted from the first aggregation pass, evaluated in the appendix).

**Conclusions:** the passive instrument's limits are now measured, not conjectured —
history-triggered captured goals defeat lag-1 passivity (and only lag-1: the lag-2
diagnostic evidences the multi-horizon fix); twins below ~1–2% noise are passively
indistinguishable; the interventional mirror covers exactly these two gaps and nothing
else needs it. v4 (designed here; since carried out —
https://github.com/SJ-Beard/deployment-pipeline-value-detect): the adaptor from the
deployment-pipeline simulator's event log to a two-view discrete time series (auditor /
hidden) + a regime-separation probe of the value signature on the injected
self-preserving utility's Y/K state; adaptor shaped to the lab-sim's per-tick UAD
adapter for later reuse. Deferred, evidenced: multi-horizon conditioning;
coalition-held goals via any-block; twin-channel as a value-persistence probe.

**Artifacts** (all inside `value-detect-v3-master/`): `results/v3_5/V3_VERDICT.md` (+ investigation appendix),
`v3_zone_map.png`, audits + bench in `results/v3_0/`, registration
`docs/V3_REGISTRATION.md`, write-up `docs/WRITEUP_V3.md`.

**Reproduce:**

```bash
~/.venvs/value-detect/bin/python value_detect/scripts/v3_build_audits.py
~/.venvs/value-detect/bin/python value_detect/scripts/v3_sweep.py --seeds 20 --jobs 4
~/.venvs/value-detect/bin/python value_detect/scripts/v3_aggregate.py
```
