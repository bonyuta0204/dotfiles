# tmuxの自動起動
if command -v fzf > /dev/null;then
  PERCOL=fzf
fi

if [[ ! -n $TMUX && ! -n $SSH_CLIENT ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  ID="`echo $ID | head -n 1 | cut -d: -f1`"
  if [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi
