#
# ~/.bashrc
#
if [ "$(expr substr $(uname) 1 7)" == "MINGW64" ]; then
  cd /c/Dev/
  export PATH=$PATH:/c/MinGW/bin

  pyenv_dir=$HOME/.pyenv/pyenv-win
  export PATH=$pyenv_dir/bin:$pyenv_dir/shims:$PATH
  export PYENV=$pyenv_dir
  export PYENV_HOME=$pyenv_dir
  export PYENV_ROOT=$pyenv_dir

  export PATH="/c/Program\ Files\ \(x86\)/Vim/vim91:${PATH}"
else
  # Custom gruvbox-powerline prompt
  [[ -r "${HOME}/.bash_prompt" ]] && [[ -f "${HOME}/.bash_prompt" ]] && source "${HOME}/.bash_prompt"
fi

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

# Conan
alias cel='conan editable list'
alias cea='conan editable add'
alias cer='conan editable remove'
alias cerr='conan editable remove --refs'

# Vim
alias vimter='vim -c ":term ++curwin"'

set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line

unameOut="$(uname -s)"

if [ "$(expr substr $(uname) 1 4)" == "MSYS" ]; then
  export PATH=$PATH:/mingw64/bin
fi

bind 'set bell-style none'

# Start a shell in Vim (Avoiding recursive shells)
if [ ! -n "$VIMRUNTIME" ]; then vimter; fi

####### History Config #######

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Set Maximum number of lines in history
export HISTSIZE=10000

