filetype off                  " required

""" Vundle & Plugins
"
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

Plugin 'kana/vim-textobj-user'

Plugin 'Julian/vim-textobj-variable-segment'

Plugin 'sgur/vim-textobj-parameter'

Plugin 'flazz/vim-colorschemes'

if !has('win32unix')
	Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'urbainvaes/vim-tmux-pilot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""" Plugin Options

if !has('win32unix')

	""" YouCompleteMe

	let g:ycm_global_ycm_extra_conf = expand('$HOME/.vim/ycm_extra_conf.py')
	let g:ycm_extra_conf_vim_data = ['getcwd()']
	let g:ycm_add_preview_to_completeopt = 1
	let g:ycm_autoclose_preview_window_after_insertion = 1
	let g:ycm_always_populate_location_list = 1

	nnoremap ,gl :YcmCompleter GoToDeclaration<CR>

	highlight YcmErrorLine guibg=#ff9923
	highlight YcmWarningSign guibg=#ffff33

endif

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

""" Menus & Sessions

set noswapfile

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set backspace=indent,eol,start

set mouse=a

set wildmenu

set wildmode=longest:full,full

""" Whitespace

set list                        " show chars defined in 'listchars'
set listchars=tab:❭\            " list of strings used for list mode
set listchars+=extends:❯,precedes:❮

augroup trailing
	au!
	au InsertEnter * set listchars-=trail:·
	au InsertLeave * set listchars+=trail:·
augroup END

""" Key Bindings

map <F2> :redraw!<CR>

vmap <Tab> >gv
vmap <S-Tab> <gv

""" Diff current buffer

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
