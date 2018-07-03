function dc
  if command -v docker-compose > /dev/null
    set -l dir (pwd)
    cd $HOME/workspace/zelda-allstars
    docker-compose $argv
    cd $dir
  end
end
