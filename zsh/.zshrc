# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=/usr/bin/vim

TERM=xterm-256color

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

for config_file (~/.zsh/*.zsh); do
  source $config_file
done

autoload -U compinit && compinit
zmodload -i zsh/complist

# User configuration

if [ -d ~/.texmf ] ; then
	export TEXMFHOME=~/.texmf
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

export QT_QPA_PLATFORMTHEME=qt5ct

export PATH="/home/joe/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export PATH=${HOME}/.cargo/bin:${PATH}

# Parallel Wireless Environment Variables
local vru_3g_dir=${HOME}/PW_Repositories/vru-3g-phy
local system_test_dir=${vru_3g_dir}/verif/systemtesttools/systemTest

export PATH=${PATH}:${system_test_dir}/tools/bin

local test_controller_path=${vru_3g_dir}/submodules/vru-common-phy/TestController
local test_controller_framework=${test_controller_path}/framework_modules
local test_controller_plugins=${test_controller_path}/vru_plugins
local vru_tc_plugins=${system_test_dir}/tc_plugins
local vru_tc_functional_scripts=${system_test_dir}/functional/testScripts_vRU

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

local vru_tc_performance_scripts=${system_test_dir}/performance/testScripts_vRU
export PYTHONPATH=${PYTHONPATH}:${vru_tc_performance_scripts}

export TCLLIBPATH=${HOME}/PW_Repositories/vru-3g-phy/verif/systemtesttools/systemTest/tcltk

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir///build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/build/lib/:/opt/mpeak/vru-3g-phy///submodules/vru-common-phy/libs/mlog/build/lib/

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/build-avx512-icc-RelWithDebInfo/submodules/vru-common-phy/libs/mlog/build/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$vru_3g_dir/submodules/vru-common-phy/libs/mlog/lib/

