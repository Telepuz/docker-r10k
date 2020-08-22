#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob globstar

# Variables
GIT_SSH_KEY="$SSH_KEY"
TIMEOUT="$TIMEOUT"

# Main function
main () {
    eval "$(ssh-agent -s)"
    echo -e "$GIT_SSH_KEY" | ssh-add -

    while true; do
        echo $(date +%Y-%m-%d-%H:%M) Update environments...
        r10k deploy environment -p
        sleep "$TIMEOUT"
    done
}
main "$@"