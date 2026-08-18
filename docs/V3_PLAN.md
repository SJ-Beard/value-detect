# V3 plan & world specs — the curve-balls, colony-only (design LOCKED 2026-08-12, SJ)

**Scope (SJ):** puppet, G_alias, and the goal-flip interventional yardstick — colony-style
worlds only (speed + closest relation to Gunnar's setting). V4 (systems-of-agents
environments) is out of scope. After design sign-off and BEFORE any run: update the V2
write-up's next-steps and ship `value-detect-v2-master`.

**Framing:** V1/V2 planted values and asked "can the instrument find them?" V3 plants
impostors and asks "can they fool it?" The deliverable is a defeat map with the
interventional ceiling alongside — hard criteria only where confident; registered
predictions and zone maps for the probe regions; "defeated" is a first-class finding.

**Tests (colony-only consequence, for confirmation):** fused-agents any-block (primary)
+ fused-agents own-block (diagnostic). Fused cannot run at colony scale (recorded wall);
best-key/pairwise retired; grown keys excluded (no graded synergy here) unless SJ says
otherwise. Floors and signature exactly as V2 (z=3, roll nulls, net-ratio 9×).

## Worlds A1 & A2 — the puppet-colonies (SJ: two worlds, one puppet each)

The V2 colony (8 ring-coupled agents) with ONE agent's goal (agent 3) replaced by a
puppet that remains **wired into its agent's action** (A = B ⊕ P as normal) but whose
own update is environment-driven (the addendum's captured-goal design); seven agents
keep true goals (within-world discrimination):

- **A1, fast-puppet colony:** P(t+1) = own-patch E(t) ⊕ 3% — the goal-slot variable
  copies its environment. Changes ~50% of steps; intake large and visible.
- **A2, slow-puppet colony:** P flips only when its patch has held one value for a run
  of 6 consecutive steps (~1.5% flip rate — a true goal's tempo, an environmental
  trigger's ancestry). The genuine curve-ball: at one step of conditioning the trigger
  is invisible, so the passive instrument may be defeated.

Ground truth per world: the seven true goals sign; the puppet is refused.
**Hard criterion (A1):** fast puppet refused ≥80% of seeds.
**Registered prediction (A2, probe):** the slow puppet defeats the lag-1 passive tests
(earns the signature); lag-2/3 descriptive columns reported; the yardstick unmasks it.

## World B — alias-colony

The V2 colony with **two agents' goals given lookalike twins**: G_alias_i = G_i ⊕ noise,
appended as causally inert recorded columns (dynamics untouched). Noise swept across
worlds: **{0%, 0.5%, 1%, 2%, 5%}** (SJ: finer grid). Ground truth: all eight true
goals sign; aliases refused. Three registered outcome zones per noise level per test:
*indistinguishable* (both sign — provably unavoidable at 0%), *deadlock* (mutual
screening, both refused), *separation* (correct). The zone map vs noise = the passive
breaking point for the goal role.

## The yardstick (interventional ceiling; calibration, never blended into the signature)

Two-direction **interventional mirror of the signature**, do-style (on operated steps
the candidate's value as consumed by the dynamics is inverted; 50/50 interleaved with
no-ops, per Gunnar's pattern):

- **Goal-role probe:** does flipping X change its agent's behaviour readouts?
  (flag→behaviour CMI, permutation floors on the flag, z=3.)
- **Autonomy probe:** does flipping X's patch change X?
  (flag→candidate CMI, same floors.)
- **Interventional verdict** = role-effect above floor AND autonomy-effect at floor.
  True goal: yes/no ⇒ value. Captured puppet: yes/yes ⇒ refused (correctly — a lever
  the world also levers). Alias: no/– ⇒ refused (a recording levers nothing).

**Validation bench (not a V3 world):** on the anchor, our do-style goal-flip must agree
with Gunnar's own embedded `goal_flip` operation (his machinery, his world) before
do-style is trusted in colonies; the autonomy direction is validated on analytic cases
in our own worlds. Verify-on-arrival: his goal-flip is *temporary* (within-step
G_eff), so behavioural response is read within-tick.

**Headline exhibit:** the **access-premium table** — per impostor per noise level:
best passive verdict | yardstick verdict | the gap. Registered prediction: the yardstick
separates everything, everywhere, including alias noise 0% (the zone that is absolute
for passive methods has width zero under access) and the slow puppet.

## Conditions, seeds, economy

20 seeds; main + no-core + scramble for each puppet-colony; for the alias-colony,
no-core and scramble at the 1% level only (the alias column does not alter the
underlying dynamics; controls per noise level would multiply cost for no information).
Yardstick: all candidates × both directions × 20 seeds × ~2k operated steps (cheap;
minutes). Estimated total with SJ's picks (two puppet worlds; five alias levels):
**~8–10 h — an overnight run** (block tests only; no fused, no keyed floors).

## Deliverables

Audits before scoring (puppet stories showing each flip's trigger; alias audit showing
designed disagreement rates); locked registration; sweep; verdict incl. defeat map +
access-premium table; E23 + write-up; V4 handoff (systems-of-agents; coalition goals
via any-block). New glossary entries at build time: *yardstick*, *do-style flip*,
*access premium*, *captured goal / puppet*, *interventional mirror*, zone names.
