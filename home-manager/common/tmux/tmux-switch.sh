#!/bin/sh

# Required variables.
session_name=$(tmux ls -F '#S' | fzf --no-mouse)

# Switch to the target session.
tmux switch-client -t "$session_name"
