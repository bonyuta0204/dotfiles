function tasks
  set TASK (bin/rake --tasks | grep -v preload | fzf +m | sed -e 's/#.*//g' | sed -e 's/\s+$//g')
  commandline bin/$TASK
end
