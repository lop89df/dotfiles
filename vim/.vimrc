filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/ReplaceWithRegister'

Plugin 'sjl/vitality.vim'

Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:ycm_global_ycm_extra_conf = expand('$HOME/.vim/ycm_extra_conf.py')
let g:ycm_extra_conf_vim_data = ['getcwd()']
let g:ycm_ad_preview_to_completeopt = 1

highlight YcmErrorLine guibg=#ff9923
highlight YcmWarningSign guibg=#ffff33

syntax on

set number

set backspace=indent,eol,start

set mouse=a

set wildmenu

set wildmode=longest:full,full 

vmap <Tab> >gv
vmap <S-Tab> <gv

filetype plugin indent on
