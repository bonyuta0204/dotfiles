function rl
  if command -v bundler > /dev/null; 
    bundle exec rails $argv
  end
end

