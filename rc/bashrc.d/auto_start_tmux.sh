# tmuxの自動起動
if command -v fzf > /dev/null;then
  PERCOL=fzf
fi

if [[ ! -n $TMUX && ! -n $SSH_CLIENT ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  echo "id; $ID"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi
