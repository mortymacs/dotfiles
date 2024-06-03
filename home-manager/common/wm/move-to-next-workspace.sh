#!/bin/bash

# Get the list of all workspaces
workspaces=$(swaymsg -t get_workspaces | jq '.[] | .num')

# Find the current workspace number
current_workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

# Calculate the next workspace number
next_workspace=$((current_workspace + 1))

# Check if the next workspace exists
if echo "$workspaces" | grep -q "^$next_workspace$"; then
    # Move to the existing next workspace
    swaymsg move container to workspace number $next_workspace
    swaymsg workspace number $next_workspace
else
    # Move to a new next workspace
    swaymsg move container to workspace number $next_workspace
    swaymsg workspace number $next_workspace
fi
