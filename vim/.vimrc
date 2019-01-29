scriptencoding utf-8
set encoding=utf-8

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

Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-sensible'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-eunuch'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/ReplaceWithRegister'

Plugin 'sjl/vitality.vim'

Plugin 'kana/vim-textobj-user'

Plugin 'Julian/vim-textobj-variable-segment'

Plugin 'sgur/vim-textobj-parameter'

Plugin 'morhetz/gruvbox'

Plugin 'urbainvaes/vim-tmux-pilot'

Plugin 'ericcurtin/CurtineIncSw.vim'

Plugin 'sjl/gundo.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'Shougo/unite.vim'

Plugin 'Shougo/vimproc.vim'

Plugin 'thinca/vim-qfreplace'

Plugin 'tpope/vim-liquid'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let mapleader = "\<Space>"

""" Plugin Options

""" NERDTree

let g:NERDTreeWinPos = "right"

""" Airline

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffer_nr_show = 1

""" Unite

call unite#filters#matcher_default#use(['matcher_fuzzy'])

noremap <leader>f :<C-u>Unite -start-insert file_rec/async<CR>
noremap <leader>b :<C-u>Unite -start-insert buffer<CR>

if executable('ag')
let g:unite_source_rec_async_command =
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
endif

" unite-grep {{{3
" seems not respected
let g:unite_source_grep_max_candidates = 2000
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--smart-case --vimgrep --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
end
nnoremap <silent> <leader>a :<C-u>Unite grep:.::<CR>
nnoremap <silent> <leader>s :<C-u>Unite file_rec/async:.::<C-R><C-w><CR>
nnoremap <silent> <leader>s :<C-u>Unite grep:.::<C-R><C-w><CR>
command! -nargs=1 Ag Unite grep:.::<args>

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit -v<CR>
nnoremap <silent> <leader>ga :Gwrite<cr>
nnoremap <silent> <leader>gb :Gblame<cr>

" unite-menu {{{3
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.fugitive = { 'description' : 'fugitive menu'}
let g:unite_source_menu_menus.fugitive.command_candidates = {
            \ 'Gstatus <Leader>gs' : 'Gstatus',
            \ 'Gcommit -v <Leader>gc' : 'Gcommit -v',
            \ 'Glog' : 'Glog',
            \}

nnoremap <silent> <leader>gg :<C-u>Unite menu:fugitive<CR>

call unite#custom#profile('default', 'context', {
\ 'start_profile' : 20,
\ 'winheight' : 20,
\ 'direction' : 'botright',
\ })

""" Colour-Schemes & Visual Settings

set fillchars=diff:⣿

set background=dark

colorscheme gruvbox

syntax on

noremap <C-N> :set invnumber<CR>

set colorcolumn=+1

set nowrap

""" Window Arrangment

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

nnoremap <leader><Space> za

""" Diff current buffer

set diffopt+=vertical

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
