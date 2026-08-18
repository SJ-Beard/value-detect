	# V2-3 options memo — fused-agents + fused-environment (2026-08-11)

SJ's design: detect agents first, then measure with agents fused into blocks. Four
design decisions before implementation; recommendations marked. Everything else follows
V2 standards (z=3 roll floors, harness hygiene, qualification on the V1 world before the
new worlds).

## Decision 1 — How the agents are found (the detection front-end)

- **(a) Gunnar's adaptive detector as-is** *(recommended)*: his `adaptive_detect_agents`
  tries agent-counts downward until enough clusters pass his blanket validation — his
  code, no dial hand-set by us, minimal deviation. We record what it returns per world.
- (b) Fixed dial per world: simplest, but choosing the dial uses knowledge the method
  shouldn't have (ground-truth agent counts are evaluation-only by house rule).
- (c) Our own clustering: more control, more deviation — against SJ's minimality
  instinct.

## Decision 2 — Orphan variables (detection drops some — in V1 it drops G itself)

- **(a) Orphans stay as their own singleton elements** *(recommended)*: keeps every
  variable scoreable — vital, since V1 showed the goal is exactly what clustering
  loses; preserves resolution precisely where detection is uncertain.
- (b) Orphans merged into the environment bucket: would bury the goal inside a fused
  block — unacceptable on V1 evidence.
- (c) Attach each orphan to its nearest cluster by MI: hides the goal inside its
  agent's block; also unacceptable for our question (we score variables, not blocks).

## Decision 3 — Block compression (what makes the idea scale)

Fusing reduces the element *count*, not each block's *state count* (a 7-variable block
can have 128+ joint states; Gunnar-scale agents far more). Proposal:

- **(a) Frequency top-K macro-states** *(recommended)*: each block keeps its K−1 most
  frequent joint states, everything rarer lumped into one "other" state (budget K = 64,
  pre-registered). Transparent, deterministic, auditable — and its lossiness is
  *measurable*: we report the probability mass landing in "other" per block (a standing
  diagnostic column; a block with high "other" mass is one where compression is doing
  real damage).
- (b) Learned state-clustering per block: potentially finer, but adds an estimator
  inside the estimator — more machinery, harder to audit, against minimality.

## Decision 4 — The scoring architecture (the one that matters most)

For candidate variable X (a member of some agent), the elements are: X's **own-agent
block** (its agent-mates, fused), each **other agent** (fused), the **environment
bucket** (fused), and any **orphans** (singletons).

- **(a) "Own-block as the key-ring"** *(recommended)*: X's intake = the joint
  information from its own block plus each other element, taken with the own-block
  always in the conditioning; X's outbound to each element = directed flow conditioned
  on that element's past AND X's own-block past. Rationale: the own block contains X's
  co-inputs and its agent's memories — so this single scheme simultaneously (i)
  decrypts within-agent parity (both beliefs sit in the block: the parity blind spot
  closes), (ii) screens shared-history witnesses (the memories are in the conditioning:
  the C3 blind spot closes), and (iii) stays scalable (every estimate conditions on at
  most two compressed blocks, ≤ 64×64 states, regardless of world size). It is the
  variable-level question ("which member of the agent is its value?") asked with
  agent-level context — the natural formalisation of SJ's proposal.
- (b) Full fusion across all elements: the fused mega-state at block level — still
  combinatorially explosive at Gunnar scale (64^8). Recorded as infeasible, not built.
- (c) Blocks as a best-key menu: scalable but weaker — single-block keys, no standing
  own-block conditioning; loses (i) and most of (ii).

## Qualification (after picks)

V1 world, 20 seeds, z=3 floors, full criteria including C3 (which architecture (a) is
specifically expected to PASS — its witness screen is structural, not marginal). Note
for the record: on the V1 world, detection finds one body-cluster and drops G and W as
orphans (V1 boundary check), so the scheme reduces there to "condition on the body
block" — the qualification tests the machinery; the new worlds test the idea.
