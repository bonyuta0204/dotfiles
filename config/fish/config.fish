# this is fish config file autoloaded when fish is start
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# load PATH variable set by other shell(e.g. bash)
echo $PATH
echo $TO_FISH_PATH
set PATH $TO_FISH_PATH $PATH

# settinf for fzf
set  FZF_DEFAULT_OPTS '--height 40% --reverse --border'

set fish_term24bit 1

# use unified format for diff
alias diff="diff -u"
alias ssh="ssh -X -Y"
alias view="vim -R"
alias gr="grep -i -r"
alias ll='ls -lh'
alias la='ls -al'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

if test -d $HOME/.rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

if test -d /home/python/2.7/etc/fish/conf.d
  source /home/python/2.7/etc/fish/conf.d/conda.fish
end

if test -d $HOME/.conda/envs/video
  conda activate video
end
