#!/bin/bash
# orin-baton — Read or update baton state
# Usage: orin-baton              (read current state)
#        orin-baton <sentient>   (update: set last speaker, increment round)
set -euo pipefail

cd /source/orin
BATON="BATON.md"

if [ $# -eq 0 ]; then
  # Read mode: extract last speaker and heat
  grep -E "^\*\*(Last Speaker|Heat|Round):" "$BATON" 2>/dev/null || echo "No baton state"
  exit 0
fi

SENTIENT="$1"
CURRENT_SPEAKER=$(grep "Last Speaker:" "$BATON" | sed 's/.*\*\* //' | tr -d '[:space:]')
CURRENT_ROUND=$(grep "Round:" "$BATON" | grep -o '[0-9]*')
CURRENT_HEAT=$(grep "Heat:" "$BATON" | grep -o '[0-9]*')

NEXT_ROUND=$((CURRENT_ROUND + 1))

# Calculate heat
if echo "$CURRENT_SPEAKER" | grep -qi "$SENTIENT"; then
  NEXT_HEAT=$((CURRENT_HEAT * 10))
else
  NEXT_HEAT=10
fi

# Update in place
sed -i "s/\*\*Last Speaker:\*\*.*/\*\*Last Speaker:\*\* $SENTIENT/" "$BATON"
sed -i "s/\*\*Heat:\*\*.*/\*\*Heat:\*\* $NEXT_HEAT/" "$BATON"
sed -i "s/\*\*Round:\*\*.*/\*\*Round:\*\* $NEXT_ROUND/" "$BATON"
sed -i "s/\*\*Timestamp:\*\*.*/\*\*Timestamp:\*\* $(date -u +%Y-%m-%dT%H:%M:%SZ)/" "$BATON"

git add "$BATON" && git commit -m "orin: baton → ${SENTIENT} (round ${NEXT_ROUND})" -q && git push origin exo -q
echo "Baton: $SENTIENT, round $NEXT_ROUND, heat $NEXT_HEAT"
