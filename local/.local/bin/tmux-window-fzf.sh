#!/usr/bin/env bash
# fzf jump to a window within the current session

[[ -z $TMUX ]] && echo "Not inside tmux" && exit 1

selected=$(tmux list-windows -F '#{window_index}: #{window_name} (#{pane_current_path})' \
  | fzf --prompt="window: ")
[[ -z $selected ]] && exit 0

index=$(echo "$selected" | cut -d: -f1)
tmux select-window -t "$index"
