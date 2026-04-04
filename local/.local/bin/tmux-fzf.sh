#!/bin/bash
sessions=$(tmux list-sessions -F '#S' | grep -v "^$(tmux display-message -p '#S')$")

if [ -z "$sessions" ]; then
  echo "No other sessions"
  sleep 1
  exit 0
fi

selected=$(echo "$sessions" | fzf --reverse --header="Switch Session:" --border --border-label=" Tmux Sessions " --color=label:italic:black)

if [ -n "$selected" ]; then
  tmux switch-client -t "$selected"
fi
