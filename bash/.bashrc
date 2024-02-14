#
# ~/.bashrc
#

alias ls='ls --color=auto'

# Git
alias gaa='git add --all'
alias gsu='git submodule update --recursive'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gsp='git stash pop'
alias gss='git stash'
alias gsii='git stash --include-untracked'
alias gfp='git push --force-with-lease'

set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
# Default prompt
#PS1='[\u@\h \W]\$ '
#

source "${HOME}/repos/env_setup.sh"

unameOut="$(uname -s)"

if [ "$(expr substr $(uname) 1 4)" == "MSYS" ]; then
  export PATH=$PATH:/mingw64/bin
fi

# Custom gruvbox-powerline prompt
[[ -r "${HOME}/.bash_prompt" ]] && [[ -f "${HOME}/.bash_prompt" ]] && source "${HOME}/.bash_prompt"

export HISTSIZE=10000

