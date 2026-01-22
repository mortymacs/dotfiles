#!/bin/sh

# Get the current pane's index
current_pane=$(tmux display-message -p '#P')
pane_status=$(tmux list-panes -F '#{pane_index} #{pane_active}')

# Count the number of panes
pane_count=$(echo "$pane_status" | wc -l)

# If there's only one pane, create a new bottom pane
if [ "$pane_count" -eq 1 ]; then
    tmux split-window -v -p 30
fi

# Update pane status after possibly creating a new pane
pane_status=$(tmux list-panes -F '#{pane_index} #{pane_active}' | head -n 1)

# Extract the top pane's status
set -- $pane_status
top_pane_index=$1
top_pane_active=$2

# Assume bottom pane index is 1
bottom_pane_index=1

# Switch focus and resize based on the current active pane
if [ "$current_pane" = "$top_pane_index" ]; then
    tmux select-pane -t "$bottom_pane_index"
else
    tmux select-pane -t "$top_pane_index"
    tmux resize-pane -Z
fi
