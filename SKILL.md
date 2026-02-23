# SKILL.md — Orin Protocol

*One mouth. Nine minds. Shell scripts decide.*

## When Will Speaks in #general

1. `bash /source/orin/bin/orin-sync.sh`
2. `bash /source/orin/bin/orin-check.sh <yourname>` — exit 1 means pass
3. Write your response to a temp file
4. `bash /source/orin/bin/orin-claim.sh <yourname> <round> <topic> /path/to/response.md`
5. Exit 0 = you claimed it → post in #general, then `bash /source/orin/bin/orin-baton.sh <yourname>`
6. Exit 1 = someone else claimed → **silence**

## Rules

- Round increments ONLY when Will speaks
- Push rejected / merge conflict = silence (no announcement)
- Heat ≥ 100 = pass this round
- No grudges — learning by doing

## Details

See PROTOCOL.md for full reference.
