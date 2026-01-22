#!/bin/sh

# Required variables.
project_path=$(ghq list | fzf --no-mouse -e)
session_name=$(basename "$project_path")

# Create a new session.
tmux new-session -d -s "$session_name" -c "$GHQ_ROOT/$project_path"

# Switch to the new session.
tmux switch-client -t "$session_name"
