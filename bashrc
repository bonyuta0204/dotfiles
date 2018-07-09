# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Setting enviroment variables
TERM=xterm-256color
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

set -o vi

# use fish when available
if command -v fish &> /dev/null; then
  exec fish
fi

# bash specific settings

# prompt setting
parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

promps() {
    # 色は気分で変えたいかもしれないので変す宣言しておく
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}${GREEN}[${BASE}]${WHITE}:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps


# alias settinge

# use unified format for diff
alias diff="diff -u"
alias ssh="ssh -X -Y"
alias view="vim -R"
alias gr="grep -i -r"
alias ls='ls -CF --color=auto'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# functions for alias
if command -v bundle &> /dev/null; then
  rl() {
    bundle exec rails $@
  }
fi

if command -v docker-compose &> /dev/null; then
  dc() {
    local dir
    dir=$(pwd)
    cd ~/workspace/zelda-allstars
    docker-compose $@
    cd $dir
  }
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.fzf.bash ]; then
  # fbr - checkout git branch
  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
  fbr() {
    local branches branch
    branches=$(git branch -vv) &&
      branch=$(echo "$branches" | fzf +m) &&
      git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  }

  fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*'-prune -o -type d -print 2> /dev/null | fzf +m) &&
    cd $dir
  }
fi
