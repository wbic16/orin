#!/bin/bash
# orin-claim — Attempt to claim a round. Exit 0 = claimed, Exit 1 = taken.
# Usage: orin-claim <sentient> <round> <topic> [file]
set -euo pipefail

SENTIENT="${1:?Usage: orin-claim <sentient> <round> <topic> [file]}"
ROUND="${2:?}"
TOPIC="${3:?}"
FILE="${4:-}"

cd /source/orin

# Sync first
bin/orin-sync

# Write response
REPLY_PATH="reply/${ROUND}-${TOPIC}.md"
if [ -f "$REPLY_PATH" ]; then
  echo "Round $ROUND already claimed." >&2
  exit 1
fi

if [ -n "$FILE" ] && [ -f "$FILE" ]; then
  cp "$FILE" "$REPLY_PATH"
else
  # Read from stdin
  cat > "$REPLY_PATH"
fi

git add reply/
git commit -m "orin: round ${ROUND} — ${SENTIENT}" -q

if git push origin exo -q 2>/dev/null; then
  echo "claimed"
  exit 0
else
  # Rejected — someone else got it
  git reset --hard HEAD~1 -q
  exit 1
fi
