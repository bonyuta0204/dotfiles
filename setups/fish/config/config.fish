# this is fish config file autoloaded when fish is start
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch FFEE99
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# load PATH variable set by other shell(e.g. bash)
set PATH $TO_FISH_PATH $PATH

# settinf for fzf
set -gx FZF_DEFAULT_OPTS '--height=40% --reverse --border'

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

function fuzzy_find_pr -d "Fuzzy-find a Pull Request ID"
  gh pr list --limit 100 | fzf | awk '{print $1}'
end

function fuzzy_find_git_branch -d "Fuzzy-find a Git Branch"
  git branch --all | grep -v HEAD | string trim | fzf
end

function fcb -d "Fuzzy-find and Checkout a Branch"
  set branch (fuzzy_find_git_branch)
  git checkout "$branch"
end

function fcp -d "Fuzzy-find and Checkout a Pull request"
  set pr_id (fuzzy_find_pr)
  gh pr checkout $pr_id
end

function fmb -d "Fuzzy-find and Merge a Branch"
  set branch (fuzzy_find_git_branch)
  git merge "$branch"
end

function fmp -d "Fuzzy-find and Merge a Pull request"
  set pr_id (fuzzy_find_pr)
  gh pr view $pr_id --jq ".headRefName" --json "headRefName" | read -l branch_name
  git merge origin/$branch_name
end

# ghq + fzf
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

# fish key bindings
function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end

if command -v rbenv > /dev/null
  status --is-interactive; and source (rbenv init -|psub)
end

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# pyenv init - | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

if command -v direnv > /dev/null
  direnv hook fish | source
end

if command -v starship > /dev/null
  starship init fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if command -v conda > /dev/null
  eval conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

