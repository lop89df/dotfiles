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

Plugin 'gcmt/taboo.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/ReplaceWithRegister'

Plugin 'kana/vim-textobj-user'

Plugin 'Julian/vim-textobj-variable-segment'

Plugin 'sgur/vim-textobj-parameter'

Plugin 'flazz/vim-colorschemes'

Plugin 'ericcurtin/CurtineIncSw.vim'

Plugin 'sjl/gundo.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'Shougo/unite.vim'

Plugin 'Shougo/vimproc.vim'

Plugin 'thinca/vim-qfreplace'

Plugin 'LucHermitte/lh-vim-lib'

Plugin 'LucHermitte/local_vimrc'

Plugin 'vim-latex/vim-latex'

Plugin 'Dave-Elec/gruvbox'

Plugin 'urbainvaes/vim-tmux-pilot'

Plugin 'preservim/nerdtree'

Plugin 'martinda/Jenkinsfile-vim-syntax'

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let $VIM = $HOME."/.vim"

let mapleader = "\<Space>"

set clipboard=unnamed

"============================================================================"
" Plugin Options
"============================================================================"


"============================================================================"
""" Airline
"============================================================================"

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
"
"" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#buffer_nr_show = 0

let g:airline#etensions#hunks#enabled = 0
let g:airline#etensions#branch#enabled = 0


let g:airline_theme='gruvbox'


"============================================================================"
""" Taboo
"============================================================================"

let g:taboo_tab_format = '[%N] %f | '
let g:taboo_renamed_tab_format = '[%N] %l | '


"============================================================================"
""" NERDTree
"============================================================================"

let g:NERDTreeWinPos = "right"


"============================================================================"
""" Unite
"============================================================================"

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

"============================================================================"
""" Vim Latex-Suite
"============================================================================"

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='lualatex'

let g:Tex_DefaultTargetFormat='pdf'


"============================================================================"
""" edit configs  {{{2
"============================================================================"

function! EditConfig(what, ext = '.vim')
    let l:dir = split(&runtimepath,',')[0]
    if a:what == 'vimrc'
        let l:file = expand($MYVIMRC)
    elseif a:what == 'tmux'
        let l:file = expand($HOME).'/.tmux.conf'
    elseif a:what == 'i3'
	let l:file = expand($HOME).'/.config/i3/config'
    elseif a:what == 'rifle'
	let l:file = expand($HOME).'/.config/ranger/rifle.conf'
    elseif a:what == 'zshrc'
	let l:file = expand($HOME).'/.zshrc'
    elseif a:what == 'i3status'
	let l:file = expand($HOME).'/.config/i3status/config'
    elseif ! isdirectory(globpath(l:dir, a:what))
        echoe a:what." is not valid!"
    elseif empty(&filetype)
        echoe 'filetype is empty!'
    else
        let l:file = l:dir.'/'.a:what.'/'.&filetype.a:ext
    endif

    execute ':e '.file
    execute ':lcd %:p:h'
endf
nmap <leader>ev :call EditConfig('vimrc')<CR>
nmap <leader>ef :call EditConfig('ftplugin')<CR>
nmap <leader>et :call EditConfig('tmux')<CR>
nmap <leader>ei :call EditConfig('i3')<CR>
nmap <leader>es :call EditConfig('i3status')<CR>
nmap <leader>ez :call EditConfig('zshrc')<CR>
nmap <leader>er :call EditConfig('rifle')<CR>

nnoremap <leader>r :source $MYVIMRC<CR>


"============================================================================"
""" Colour-Schemes & Visual Settings
"============================================================================"

set fillchars=diff:⣿

"""augroup my_colours
"""  autocmd!
"""  autocmd ColorScheme gruvbox hi SpellBad cterm=reverse
"""augroup END

let g:gruvbox_vert_split='bg2'
"""let g:gruvbox_transparent_bg = 1

set background=dark

colorscheme gruvbox

autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

""" Syntax highlighting on by default
syntax on

""" Relative line numbers on by default
set number
set relativenumber

""" Toggle relative line numbers
noremap <C-N> :if (!&number && !&relativenumber)<CR>
              \set number \| set relativenumber<CR>
              \else <CR>
              \set nonumber \| set norelativenumber<CR>
              \endif<CR><CR>


set colorcolumn=+1

""" Don't wrap lines by default
set nowrap

set cursorline

""" Window Arrangment
set splitright
set splitbelow

""" Menus & Sessions
set noswapfile

""" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

set backspace=indent,eol,start

""" Allow visual selection with mouse
set mouse=a

""" Enable filepath suggestions + configure
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

""" Spelling

set nospell

""" Modelines

set modeline

""" Key Bindings

map <F2> :redraw!<CR>

vmap <Tab> >gv
vmap <S-Tab> <gv

nnoremap <leader><Space> za

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Q ^
nnoremap K $

nnoremap <C-t> :tabnew<CR>

""" git log --all
nmap <leader>gv :Gitv --all<CR>

function! s:gTabDiff(branch)
	tabedit %|Git diff string(a:branch)
endf

command! -nargs=1 GdiffInTab call s:gTabDiff(<f-args>)

"
" Sample command W
" 
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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
