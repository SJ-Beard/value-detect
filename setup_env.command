#!/bin/bash
#
# One-time environment setup for value-detect v1.
#
# WHAT THIS DOES:
#   Creates a local virtualenv at ~/.venvs/value-detect, installs the pinned
#   requirements, and links the source folders via a .pth file: this folder's
#   value_detect/ plus the uad_handles and agency_detect packages from your
#   agency-detect repository (imported in place; nothing there is modified —
#   note `pip install -e` on uad_handles currently fails because its
#   pyproject licence field points outside the package folder, hence the .pth).
#
# HOW TO RUN:
#   Double-click in Finder, or from a terminal:
#     ./setup_env.command [path-to-agency-detect-repo]
#   With no argument, it looks for the agency-detect repo in the common spots:
#   a sibling folder of this one named agency-detect-master, agency-detect,
#   or agency_detect.
#
# Safe to run again any time; it rebuilds a clean environment.

set -euo pipefail

BUNDLE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV="$HOME/.venvs/value-detect"

# 1. Locate the agency-detect repository.
AGENCY_ROOT="${1:-}"
if [ -z "$AGENCY_ROOT" ]; then
  for cand in "$BUNDLE_ROOT/../agency-detect-master" "$BUNDLE_ROOT/../agency-detect" "$BUNDLE_ROOT/../agency_detect" "$BUNDLE_ROOT/../GunnarZarncke/agency-detect"; do
    if [ -d "$cand/uad_handles/src/uad_handles" ]; then
      AGENCY_ROOT="$(cd "$cand" && pwd)"
      break
    fi
  done
fi
if [ -z "$AGENCY_ROOT" ] || [ ! -d "$AGENCY_ROOT/uad_handles/src/uad_handles" ]; then
  echo "ERROR: could not find the agency-detect repository (looked for uad_handles/src/uad_handles)."
  echo "Run again with the path, e.g.:  ./setup_env.command /path/to/agency-detect"
  exit 1
fi

echo "=================================================================="
echo " value-detect v1 — environment setup"
echo " This bundle:   $BUNDLE_ROOT"
echo " agency-detect: $AGENCY_ROOT"
echo " Environment:   $VENV  (local to this machine)"
echo "=================================================================="

# 2. Base Python.
PYBASE="$(command -v python3 || true)"
if [ -z "$PYBASE" ]; then
  echo "ERROR: no python3 found. Install Python 3.9+ and run again."
  exit 1
fi
echo "Using base Python: $PYBASE ($($PYBASE --version 2>&1))"

# 3. Fresh venv + pinned packages.
if [ -d "$VENV" ]; then
  echo "Removing previous environment for a clean rebuild..."
  rm -rf "$VENV"
fi
"$PYBASE" -m venv "$VENV"
echo "Installing packages (a couple of minutes the first time)..."
"$VENV/bin/python" -m pip install --quiet --upgrade pip
"$VENV/bin/python" -m pip install --quiet -r "$BUNDLE_ROOT/requirements.txt"

# 4. Link the source folders.
SITE_PKGS="$("$VENV/bin/python" -c 'import site; print(site.getsitepackages()[0])')"
PTH="$SITE_PKGS/value_project_paths.pth"
{
  echo "$AGENCY_ROOT/uad_handles/src"
  echo "$AGENCY_ROOT/agency_detect/src"
  echo "$BUNDLE_ROOT/value_detect/src"
} > "$PTH"
echo "Linked source folders via: $PTH"

# 5. Verify.
echo "Verifying..."
"$VENV/bin/python" -c "import uad_handles, value_detect; print('  imports OK:', value_detect.variable_names())"
"$VENV/bin/python" -m pytest "$BUNDLE_ROOT/value_detect/tests" -q -p no:cacheprovider 2>/dev/null \
  && echo "  tests OK" || echo "  (tests reported an issue — scroll up for details)"

echo "=================================================================="
echo " Done. Quickstart:"
echo "   \"$VENV/bin/python\" \"$BUNDLE_ROOT/value_detect/scripts/chunk4_directional_scores.py\""
echo "=================================================================="
