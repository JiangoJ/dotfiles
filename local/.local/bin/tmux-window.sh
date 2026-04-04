#!/usr/bin/env bash
# Create a new window, optionally fzf-picking the working directory

if [[ -z $TMUX ]]; then
  echo "Not inside tmux" && exit 1
fi

if [[ $# -eq 1 ]]; then
  search_root=$1
else
  search_root=$HOME
fi

selected=$(find "$search_root" -mindepth 1 -maxdepth 3 -type d 2>/dev/null | fzf --prompt="window dir: ")
[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

# If a window with that name already exists, just jump to it
if tmux list-windows -F '#{window_name}' | grep -q "^${selected_name}$"; then
  tmux select-window -t "$selected_name"
else
  tmux new-window -n "$selected_name" -c "$selected"
fi
