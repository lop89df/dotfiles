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

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-sensible'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-eunuch'

Plugin 'tpope/vim-obsession'

Plugin 'tpope/vim-rhubarb'

Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/ReplaceWithRegister'

Plugin 'kana/vim-textobj-user'

Plugin 'Julian/vim-textobj-variable-segment'

Plugin 'sgur/vim-textobj-parameter'

Plugin 'ericcurtin/CurtineIncSw.vim'

Plugin 'sjl/gundo.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'Shougo/unite.vim'

Plugin 'Shougo/vimproc.vim'

Plugin 'thinca/vim-qfreplace'

Plugin 'LucHermitte/lh-vim-lib'

Plugin 'LucHermitte/local_vimrc'

Plugin 'vim-latex/vim-latex'

Plugin 'urbainvaes/vim-tmux-pilot'

Plugin 'preservim/nerdtree'

Plugin 'martinda/Jenkinsfile-vim-syntax'

Plugin 'plasticboy/vim-markdown'

Plugin 'wincent/command-t'

Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let $VIM = $HOME."/.vim"

let mapleader = "\<Space>"

set clipboard=unnamed

"============================================================================"
" Plugin Options
"============================================================================"

set sessionoptions+=globals

"============================================================================"
""" Airline
"============================================================================"

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#fileformat#enabled = 0

"============================================================================"
""" Tabline
"============================================================================"

let g:session_dir = '~/.vim/sessions'

" Remaps for Sessions
exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

set tabline=%!MyTabLine()

" Our custom TabLine function
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} |'
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

    let s .= '%=' " Right-align after this

    if exists('g:this_obsession')
        let s .= '%#diffadd#' " Use the "DiffAdd" color if in a session
    endif

    " add vim-obsession status if available
    if exists(':Obsession')
        let s .= "%{ObsessionStatus()}"
        if exists('v:this_session') && v:this_session != ''
            let s .= ' ' . v:this_session . ' '
            let s .= '%*' " Restore default color
        endif
    endif

  return s
endfunction

" Required for MyTabLine()
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction


"============================================================================"
""" NERDTree
"============================================================================"

let g:NERDTreeWinPos = "right"


"============================================================================"
""" Unite
"============================================================================"

"let &runtimepath.=',~/.vim/bundle/vimproc.vim/lib'

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

nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
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
    elseif a:what == 'bashrc'
	let l:file = expand($HOME).'/.bashrc'
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
nmap <leader>eb :call EditConfig('bashrc')<CR>
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
