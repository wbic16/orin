#!/bin/bash
# orin-sync — Pull latest, rebase on exo branch
set -euo pipefail
cd /source/orin
git pull --rebase origin exo 2>/dev/null || git pull origin exo
