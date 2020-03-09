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

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fpr -d "Fuzzy-find and checkout a github pull request"
  gh pr list | fzf | read -l result; and echo "$result" | awk '{print $1}' | read -l pr_id; and gh pr checkout $pr_id
end

if test -d $HOME/.rbenv
  status --is-interactive; and source (rbenv init -|psub)
end
