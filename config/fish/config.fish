# this is fish config file autoloaded when fish is start
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red


# settinf for fzf
set  FZF_DEFAULT_OPTS '--height 40% --reverse --border'

set fish_term24bit 1

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

if test -d /home/python/2.7/etc/fish/conf.d
  source /home/python/2.7/etc/fish/conf.d/conda.fish
end
