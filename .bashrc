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
export PATH=$HOME/local/lib/python2.7/site-packages:$PATH
export PATH=$HOME/local/opt/pycharm-community-2017.3.1/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=$HOME/local/bin/python-module:$PYTHONPATH


set -o vi

# to import caffe
export LD_PRELOAD=/home/python/2.7/lib/libmkl_core.so:/home/python/2.7/lib/libmkl_sequential.so
# alias settinge


# use unified format for diff
alias diff="diff -u"
alias ssh="ssh -X -Y"
alias view="vim -R"
alias ll="ls -lh"
