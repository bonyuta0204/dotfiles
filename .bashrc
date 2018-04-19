# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# user specific aliases and functions
term=xterm-256color
export path=$home/local/bin:$path
export path=$home/local/lib/python2.7/site-packages:$path
export path=$home/local/opt/pycharm-community-2017.3.1/bin:$path
export ld_library_path=$home/local/lib:$ld_library_path
export pythonpath=$home/local/lib/python2.7/site-packages:$pythonpath
export pythonpath=$home/local/bin/python-module:$pythonpath


set -o vi

# to import caffe
export LD_PRELOAD=/home/python/2.7/lib/libmkl_core.so:/home/python/2.7/lib/libmkl_sequential.so
# alias settinge


# use unified format for diff
alias diff="diff -u"
alias ssh="ssh -X -Y"
alias view="vim -R"
alias ll="ls -lh"
