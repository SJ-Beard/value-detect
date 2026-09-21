#!/bin/bash
# One-click rebuild for the paper (double-click me in Finder).
# Runs the full LaTeX sequence so citations and cross-references always resolve:
# pdflatex -> bibtex (builds the bibliography) -> pdflatex twice (stitches it in).
cd "$(dirname "$0")"
export PATH="/Library/TeX/texbin:$PATH"
set -e
pdflatex -interaction=nonstopmode value_discovery
bibtex value_discovery
pdflatex -interaction=nonstopmode value_discovery
pdflatex -interaction=nonstopmode value_discovery
echo
echo "Done: value_discovery.pdf rebuilt with citations."
echo "(If you only edit text and the .bbl file is present, a single build in your"
echo " editor also works; run me again after adding or removing any citation.)"
