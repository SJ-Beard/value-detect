# Paper draft — "Unsupervised Value Discovery"

`value_discovery.tex` + `references.bib` + `figures/`. Standard arXiv-style
`article` class (11pt, 1in margins, natbib/plainnat, hyperref, booktabs, authblk).
Structurally verified (braces, environments, citations, cross-refs, figures); **not
compiled here** — this Mac has no LaTeX toolchain.

## To compile

Overleaf (easiest): upload the folder as a project; compile with pdfLaTeX. Locally:

```bash
pdflatex value_discovery && bibtex value_discovery && pdflatex value_discovery && pdflatex value_discovery
```

(or `latexmk -pdf value_discovery`).

## Before any circulation — two placeholders to resolve

1. `references.bib` → `empowermentplasticity2025`: the arXiv number 2505.10361 is the
   one recorded in our technical addendum; the exact title/author list must be checked
   against the arXiv record (marked in the entry's `note`).
2. `references.bib` → `zarncke2026uad`: currently cites the codebase; replace with the
   published references for the UAD paper and the access-model (handles) paper.

## Status

Draft for SJ's review; not for submission (declared in the paper's disclosure section).
Figures are the project's own artifacts (`docs/writeup_figures/`).
