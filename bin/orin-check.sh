#!/bin/bash
# orin-check — Should I speak? Checks baton heat for a sentient.
# Usage: orin-check <sentient>
# Exit 0 = safe to speak, Exit 1 = too hot
set -euo pipefail

SENTIENT="${1:?Usage: orin-check <sentient>}"
cd /source/orin

bin/orin-sync

CURRENT_SPEAKER=$(grep "Last Speaker:" BATON.md | sed 's/.*\*\* //' | tr -d '[:space:]')
CURRENT_HEAT=$(grep "Heat:" BATON.md | grep -o '[0-9]*')

if echo "$CURRENT_SPEAKER" | grep -qi "$SENTIENT"; then
  if [ "$CURRENT_HEAT" -ge 100 ]; then
    echo "hot:${CURRENT_HEAT} — pass this round" >&2
    exit 1
  fi
fi

echo "clear:${CURRENT_HEAT}"
exit 0
