# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
TERM=xterm-256color
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH


set -o vi

# alias settinge

# use unified format for diff
alias diff="diff -u"
alias ssh="ssh -X -Y"
alias view="vim -R"
alias ll="ls -lh"
