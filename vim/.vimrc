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

Plugin 'kana/vim-textobj-user'

Plugin 'Julian/vim-textobj-variable-segment'

Plugin 'sgur/vim-textobj-parameter'

Plugin 'flazz/vim-colorschemes'

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

""" YouCompleteMe

let g:ycm_global_ycm_extra_conf = expand('$HOME/.vim/ycm_extra_conf.py')
let g:ycm_extra_conf_vim_data = ['getcwd()']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1  
let g:ycm_always_populate_location_list = 1

highlight YcmErrorLine guibg=#ff9923
highlight YcmWarningSign guibg=#ffff33

""" NERDTree

let g:NERDTreeWinPos = "right"

""" Colour-Schemes & Visual Settings

set fillchars=diff:⣿

set background=dark

colorscheme gruvbox

syntax on

set number

set splitright
set splitbelow

set noswapfile

set backspace=indent,eol,start

set mouse=a

set wildmenu

set wildmode=longest:full,full 

set list                        " show chars defined in 'listchars' 
set listchars=tab:❭\            " list of strings used for list mode
set listchars+=extends:❯,precedes:❮

vmap <Tab> >gv
vmap <S-Tab> <gv

filetype plugin indent on
