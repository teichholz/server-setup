#!/usr/bin/env bash
set -euo pipefail

MAX_SNAPSHOTS=10

echo "$(date -Iseconds) Taking snapshot..."
BIN=/home/tim/.local/bin/anki-ai
$BIN snapshot

SNAPSHOTS=$($BIN snapshots)
COUNT=$(echo "$SNAPSHOTS" | jq 'length')

echo "$(date -Iseconds) Snapshot count: $COUNT (max: $MAX_SNAPSHOTS)"

if [ "$COUNT" -gt "$MAX_SNAPSHOTS" ]; then
    TO_DELETE=$(( COUNT - MAX_SNAPSHOTS ))
    echo "$(date -Iseconds) Pruning $TO_DELETE old snapshot(s)..."

    echo "$SNAPSHOTS" \
        | jq -r 'sort_by(.name) | .[0:'"$TO_DELETE"'] | .[].path' \
        | while IFS= read -r path; do
            echo "$(date -Iseconds) Deleting: $path"
            rm -f "$path"
        done
fi

echo "$(date -Iseconds) Done."
