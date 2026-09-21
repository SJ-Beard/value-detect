# Paper draft — "Unsupervised Value Discovery"

`value_discovery.tex` + `references.bib` + `figures/` + the built
`value_discovery.pdf`. Standard arXiv-style `article` class (11pt, 1in margins,
natbib/plainnat, hyperref, booktabs, authblk). Compiled locally with MacTeX
(2026-09-09; zero errors); the committed PDF is the current build.

## To compile

**Easiest: double-click `build_paper.command`** — it runs the full sequence
(pdflatex → bibtex → pdflatex ×2) so citations always resolve. A single build from an
editor only works while the `value_discovery.bbl` file from a previous full build is
present; if citations ever show as [?], run `build_paper.command` once. Command line:

```bash
pdflatex value_discovery && bibtex value_discovery && pdflatex value_discovery && pdflatex value_discovery
```

(or `latexmk -pdf value_discovery`).

## References

Both former placeholders are resolved (2026-08-18): `abel2025plasticity` is Abel et al.,
"Plasticity as the Mirror of Empowerment", *Advances in Neural Information Processing
Systems* 38 (NeurIPS 2025), with the arXiv link (2505.10361) for ease of access;
`zarncke2025uad` is Zarncke, "Foundations of Unsupervised Agent Discovery in Raw
Dynamical Systems", technical report, AE Studio, 2025.

## Status

Draft for SJ's review; not for submission. Sole author SJ Beard; the title-page note and
the closing "Statement on use of AI" disclose that the draft was written by Claude and
reviewed and approved by the author. Figures are the project's own artifacts
(`docs/writeup_figures/`).
