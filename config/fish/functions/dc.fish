function dc
  if command -v docker-compose > /dev/null
    set -l dir (pwd)
    if [ -z $ALLSTAR_DIR ]
      set -x ALLSTAR_DIR $HOME/zelda-allstars
    end
    cd $ALLSTAR_DIR
    docker-compose $argv
    cd $dir
  end
end
