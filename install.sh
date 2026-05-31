#!/usr/bin/env bash
# Install Hermes skills to ~/.hermes/skills/
#
# Usage:
#   ./install.sh              — install all skills
#   ./install.sh <skill-name> — install a single skill
#
# Override target with HERMES_HOME env var (default: ~/.hermes)

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"
TARGET_DIR="${HERMES_HOME:-$HOME/.hermes}/skills"

install_skill() {
    local name="$1"
    local src="$SKILLS_SRC/$name"
    if [[ ! -d "$src" ]]; then
        echo "error: skill not found: $name" >&2
        exit 1
    fi
    mkdir -p "$TARGET_DIR/$name"
    cp -r "$src/." "$TARGET_DIR/$name/"
    echo "installed: $name"
}

if [[ $# -gt 0 ]]; then
    install_skill "$1"
else
    mkdir -p "$TARGET_DIR"
    for skill_dir in "$SKILLS_SRC"/*/; do
        install_skill "$(basename "$skill_dir")"
    done
fi
