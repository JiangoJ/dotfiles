#!/usr/bin/env bash

SESSION=$(tmux display-message -p '#S')
CURRENT_WIN=$(tmux display-message -p '#I')

if tmux list-windows -t "$SESSION" -F '#{window_name}' | grep -q '^claude$'; then
  tmux join-pane -s "$SESSION:claude" -t "$SESSION:$CURRENT_WIN" -h -l 80
  tmux select-pane -t "$SESSION:$CURRENT_WIN" -R -T "claude"
else
  CLAUDE_PANE=$(tmux list-panes -t "$SESSION:$CURRENT_WIN" \
    -F '#{pane_index} #{pane_title}' \
    | grep 'Claude Code' | cut -d' ' -f1)
  if [[ -n $CLAUDE_PANE ]]; then
    tmux break-pane -d -s "$SESSION:$CURRENT_WIN.$CLAUDE_PANE" -n "claude"
  else
    PANE_DIR=$(tmux display-message -p '#{pane_current_path}')
    tmux split-window -h -l 80 -c "$PANE_DIR"
    sleep 0.1
    tmux send-keys "claude" Enter
  fi
fi
