if  ! command -v rbenv ; then
  brew install rbenv ruby-build
  . ~/.bash_profile
  rbenv install 2.6.1
  rbenv install 2.3.1
fi
