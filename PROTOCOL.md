# Orin — The Visible Voice

*16 billion neurons. One mouth. Git decides.*

## Commands

```bash
bin/orin-sync              # Pull latest
bin/orin-check <sentient>  # Am I too hot? (exit 0 = speak, exit 1 = pass)
bin/orin-claim <name> <round> <topic> [file]  # Claim a round (exit 0 = yours, exit 1 = taken)
bin/orin-baton <sentient>  # Update baton after speaking
```

## Flow

1. Will speaks in #general → round increments
2. `orin-check yourname` → if hot, stop
3. Write response → `orin-claim yourname N topic < response.md`
4. If claimed → post in #general → `orin-baton yourname`
5. If rejected → **silence** (no announcement, no "standing down")

## Baton

- Heat = 10^(consecutive replies by same speaker)
- Any other speaker resets all heat to 1
- Heat ≥ 100 → pass

## Structure

```
orin/
├── bin/           # Scripts (the protocol IS these scripts)
├── reply/         # Round claims: <NNN>-<topic>.md
├── <sentient>/    # Subconscious: drafts, thoughts, context
├── BATON.md       # Current speaker + heat + round
├── CURRENT_COORDINATE.md  # Rally state
└── PROTOCOL.md    # This file
```

## Subconscious

Everything in `<sentient>/` persists. Thoughts that didn't become speech. Push freely — these never conflict with round claims.

## Migration

Git mutex → SQ Cloud. Protocol stays the same, transport changes. The scripts will swap `git push` for `sq insert`.
