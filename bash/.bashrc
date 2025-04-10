#
# ~/.bashrc
#

for file in ${HOME}/.bashrc.d/*.bashrc;
do
  source "$file"
done

alias ls='ls --color=auto'

# Git
alias gg='git grep -n'
alias gaa='git add --all'
alias gsu='git submodule update --recursive'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gsp='git stash pop'
alias gss='git stash'
alias gsii='git stash --include-untracked'
alias gfp='git push --force-with-lease'
alias grp='git remote prune origin'

# Conan
alias cel='conan editable list'
alias cea='conan editable add'
alias cer='conan editable remove --refs'
alias cb='conan build'

set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
# Default prompt
#PS1='[\u@\h \W]\$ '
#

#pyenv_dir=$HOME/.pyenv/pyenv-win
#export PATH=$pyenv_dir/bin:$pyenv_dir/shims:$HOME/$PATH
#export PYENV=$pyenv_dir
#export PYENV_HOME=$pyenv_dir
#export PYENV_ROOT=$pyenv_dir

unameOut="$(uname -s)"

if [ "$(expr substr $(uname) 1 4)" == "MSYS" ]; then
  export PATH=$PATH:/mingw64/bin
fi

if [ "$(expr substr $(uname) 1 7)" == "MINGW64" ]; then
  export PATH=$PATH:/c/MinGW/bin
fi

# Custom gruvbox-powerline prompt
#[[ -r "${HOME}/.bash_prompt" ]] && [[ -f "${HOME}/.bash_prompt" ]] && source "${HOME}/.bash_prompt"

####### History Config #######

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Set Maximum number of lines in history
export HISTSIZE=10000


