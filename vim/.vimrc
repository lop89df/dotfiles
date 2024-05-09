scriptencoding utf-8
set encoding=utf-8

filetype off                  " required

""" VimPlug & Plugins
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-obsession'

Plug 'tpope/vim-rhubarb'

Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'kana/vim-textobj-user'

Plug 'Julian/vim-textobj-variable-segment'

Plug 'sgur/vim-textobj-parameter'

Plug 'ericcurtin/CurtineIncSw.vim'

Plug 'sjl/gundo.vim'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Shougo/unite.vim'

Plug 'thinca/vim-qfreplace'

Plug 'LucHermitte/lh-vim-lib'

Plug 'LucHermitte/local_vimrc'

Plug 'vim-latex/vim-latex'

Plug 'Dave-Elec/gruvbox'

Plug 'urbainvaes/vim-tmux-pilot'

Plug 'preservim/nerdtree'

Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'plasticboy/vim-markdown'

Plug 'wincent/command-t'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

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
let NERDTreeShowHidden = 1


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
""" Vim Markdown
"============================================================================"

let g:vim_markdown_folding_disabled = 1


"============================================================================"
""" edit configs  {{{2
"============================================================================"

function! EditConfig(what, ext = '.vim')
    let l:dir = split(&runtimepath,',')[0]
    if a:what == 'vimrc'
        let l:file = expand($MYVIMRC)
    elseif a:what == 'git'
        let l:file = expand($HOME).'/.gitconfig'
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
nmap <leader>eg :call EditConfig('git')<CR>
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

"============================================================================"
""" Key Bindings
"============================================================================"

map <F2> :redraw!<CR>

" Visual mode indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

" jump to last cursor position
noremap ' `

" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" Toggle all folds
nnoremap <leader><Space> za

" Concise window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-t> :tabnew<CR>

" display the number of matches for the last search
nmap <Leader># :%s:<C-R>/::gn<CR>

" center cursor after search and open folds
nnoremap n nzzzv
nnoremap N Nzzzv

" same when jumping around
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap <c-o> <c-o>zzzv
nnoremap <c-i> <c-i>zzzv

" add line without changing position or leaving mode
noremap <silent> <Leader>o :set paste<CR>m`o<ESC>``:set nopaste<CR>
noremap <silent> <Leader>O :set paste<CR>m`O<ESC>``:set nopaste<CR>

"
" Write file with sudo
"
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

""" Wipe empty buffers
function s:WipeBuffersWithoutFiles()
    let bufs=filter(range(1, bufnr('$')), 'bufexists(v:val) && '.
                                          \'empty(getbufvar(v:val, "&buftype")) && '.
                                          \'!filereadable(bufname(v:val))')
    if !empty(bufs)
        execute 'bwipeout' join(bufs)
    endif
endfunction
command BWnex call s:WipeBuffersWithoutFiles()

"
" Permanent very-magic mode
"
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//
