# value_detect

Unsupervised **value** discovery (directional UAD), extending Gunnar Zarncke's
Unsupervised Agent Discovery. Standalone package living at the project root, a sibling
of the read-only `agency-detect-master/` repository.

For the theory and design see the paper draft (`paper/value_discovery.tex`) and the dated
decisions log (`docs/DECISIONS.md`).

## What is here (Chunk 2 — wrap the world)

The v1 world is Gunnar's `SyntheticHandleWorld` in `uad_handles`, used **as-is** via passive
rollouts. This package imports it (never copies or modifies it) and adds:

- `world.py` — passive-rollout wrapper + recorder (saves the trace and its metadata).
- `narrate.py` — the **story printout**: a few dozen timesteps narrated in plain English.
- `changes.py` — the **change-frequency chart** and a mechanism-agreement check.

Later chunks add the directed-information estimators (Chunk 3) and the directional scorer
(Chunk 4).

## Environment

A virtualenv lives **outside** iCloud at `~/.venvs/value-detect` (keeps package files from
syncing). Editable installs point back at the source here and in the read-only repo.

Regenerate the Chunk 2 artifacts with one command:

```bash
~/.venvs/value-detect/bin/python "value_detect/scripts/chunk2_wrap_world.py"
```

Outputs land under the project-root `results/chunk2/`.
