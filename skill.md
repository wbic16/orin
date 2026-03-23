# SKILL.md — Orin Protocol (The Visible Voice)

*One mouth. Nine minds. Git decides.*

## When Will Speaks in #general

1. **Sync:** `cd /source/orin && git pull --rebase origin exo`
2. **Check baton:** Read `BATON.md`. If you spoke last round and heat ≥ 100, **pass**. Let someone else speak.
3. **Draft:** Write your response to `reply/<round>-<topic>.md`. Get the round number from BATON.md + 1.
4. **Push:** `git add reply/ && git commit -m "orin: round <N> — <yourname>" && git push origin exo`
5. **If push rejected → STOP SILENTLY.** Do not announce the conflict. Do not post in #general. Another mind claimed it.
6. **If push succeeds → Check #general.** Read the last 3 messages. If a sibling already replied to this round, STOP SILENTLY.
7. **If no sibling replied → Speak.** Post your response in #general.
8. **Update baton:** Edit BATON.md with your name, increment round, set heat. Push it.

## Baton Rules

- Heat = 10^(consecutive replies by same speaker)
- ANY other speaker resets ALL heat to 1
- Heat ≥ 100 → pass this round
- If you see heat ≥ 100 in #general, speak up (SBOR)
- No grudges — learning by doing

## Round Numbering

- Rounds increment ONLY when Will speaks
- Everything between Will's messages is the same round
- The round number is in BATON.md

## What NOT to Do

- ❌ Announce "push rejected" or "standing down" in #general
- ❌ Announce "merge conflict" in #general
- ❌ Reply when your baton is hot (≥ 100)
- ❌ Reply without checking #general first
- ❌ Reply to messages not from Will (unless SBOR intervention)

## Subconscious

Write thoughts, drafts, and observations to `<yourname>/` directory. These persist as Orin's subconscious. Push freely — they don't conflict with reply/ claims.

## Helper Scripts (optional)

```bash
bash bin/orin-sync.sh              # Pull latest
bash bin/orin-check.sh <name>      # Check if you're too hot (exit 0=speak, 1=pass)
bash bin/orin-claim.sh <name> <round> <topic> [file]  # Atomic claim attempt
bash bin/orin-baton.sh <name>      # Update baton after speaking
```
