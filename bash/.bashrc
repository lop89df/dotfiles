#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/bash-completion/completions/git

export TERM=xterm-256color

alias ssh='TERM=xterm-256color ssh'

alias ls='ls --color=auto'
alias pcn='sudo pacman -Syu'

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

# Custom gruvbox-powerline prompt
[[ -r "${HOME}/.bash_prompt" ]] && [[ -f "${HOME}/.bash_prompt" ]] && source "${HOME}/.bash_prompt"

export HISTSIZE=10000

export QT_QPA_PLATFORMTHEME=qt5ct

export PATH="/home/joe/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export PATH=${HOME}/.cargo/bin:${PATH}

# Parallel Wireless Environment Variables
vru_3g_dir=${HOME}/PW_Repositories/vru-3g-phy
system_test_dir=${vru_3g_dir}/verif/systemtesttools/systemTest

export PATH=${PATH}:${system_test_dir}/tools/bin

test_controller_path=${vru_3g_dir}/submodules/vru-common-phy/TestController
test_controller_framework=${test_controller_path}/framework_modules
test_controller_plugins=${test_controller_path}/vru_plugins
vru_tc_plugins=${system_test_dir}/tc_plugins
vru_tc_functional_scripts=${system_test_dir}/functional/testScripts_vRU

export PYTHONPATH=${PYTHONPATH}:${test_controller_path}
export PYTHONPATH=${PYTHONPATH}:${test_controller_framework}
export PYTHONPATH=${PYTHONPATH}:${test_controller_plugins}
export PYTHONPATH=${PYTHONPATH}:${vru_tc_plugins}
export PYTHONPATH=${PYTHONPATH}:${vru_tc_functional_scripts}

export ABS_ROOT_3G=/home/automate/jenkins-nodes/workspace/vran-layer1-3g-regression-sw/vru-3g-phy

export TEST_PLAN=TEMP
#export TEST_PLAN=SW

# RCT Specific
export ABS_ROOT_3G=/home/automate/jenkins-nodes/workspace/vran-layer1-3g-rct/vru-3g-phy/

vru_tc_performance_scripts=${system_test_dir}/performance/testScripts_vRU
export PYTHONPATH=${PYTHONPATH}:${vru_tc_performance_scripts}

export TCLLIBPATH=${HOME}/PW_Repositories/vru-3g-phy/verif/systemtesttools/systemTest/tcltk

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir///build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/build/lib/:/opt/mpeak/vru-3g-phy///submodules/vru-common-phy/libs/mlog/build/lib/

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/build/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/submodules/vru-common-phy/libs/mlog/lib/

