#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

OUT=docs/assets
TMP=$(mktemp -d)
mkdir -p "$OUT"
export FORCE_COLOR=1 LAKE_ARTIFACT_CACHE=true LAKE_RESTORE_ARTIFACTS=true

shot() {
  local name=$1 cols=$2
  shift 2
  COLUMNS="$cols" "$@" 2>&1 | perl -pe 'BEGIN{$h=$ENV{HOME};$p=" " x (length($h)-1)} s/\Q$h\E(\S*)/~$1$p/g' > "$TMP/$name.ansi"
  uv run --quiet --with pillow python scripts/render-ansi.py "$TMP/$name.ansi" "$OUT/$name.png" >/dev/null
  echo "  $OUT/$name.png"
}

FIX=tests/fixtures/lean/good_decide
shot mh 92 uv run mh
shot doctor 120 uv run mh doctor
shot check 92 uv run mh check --challenge "$FIX/Challenge.lean" --solution "$FIX/Solution.lean" --theorem t --origin own
