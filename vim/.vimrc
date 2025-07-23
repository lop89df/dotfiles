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

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'rbong/vim-flog'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'kana/vim-textobj-user'

Plug 'Julian/vim-textobj-variable-segment'

Plug 'sgur/vim-textobj-parameter'

Plug 'tpope/vim-obsession'

Plug 'airblade/vim-gitgutter'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let $VIM = $HOME."/.vim"

let mapleader = "\<Space>"

set clipboard=unnamed

set belloff=all

"============================================================================"
" Tab and textwidth defaults
"============================================================================"
set textwidth=100

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"============================================================================"
" Plugin Options
"============================================================================"
set sessionoptions+=globals

""============================================================================"
"""" Gitgutter
""============================================================================"
let g:gitgutter_eager = 0

""============================================================================"
"""" vim-fugitive
""============================================================================"
noremap <Leader>g :vert Git<CR>

command -nargs=* Glg vert Git! lga

""============================================================================"
"""" vim-flog
""============================================================================"

let g:flog_use_internal_lua = 0

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
    elseif a:what == 'inputrc'
        let l:file = expand($HOME).'/.inputrc'
    elseif a:what == 'bashrc'
        let l:file = expand($HOME).'/.bashrc'
    elseif ! isdirectory(globpath(l:dir, a:what))
        echoe a:what." is not valid!"
    elseif empty(&filetype)
        echoe 'filetype is empty!'
    else
        let l:file = l:dir.'/'.a:what.'/'.&filetype.a:ext
    endif

    execute ':vsp '.file
    execute ':lcd %:p:h'
endf
nmap <leader>ev :call EditConfig('vimrc')<CR>
nmap <leader>ef :call EditConfig('ftplugin')<CR>
nmap <leader>eg :call EditConfig('git')<CR>
nmap <leader>et :call EditConfig('tmux')<CR>
nmap <leader>ei :call EditConfig('inputrc')<CR>
nmap <leader>eb :call EditConfig('bashrc')<CR>

nnoremap <leader>r :source $MYVIMRC<CR>

nmap <leader>t :ter<CR>
nmap <leader>v :vert ter<CR>

"============================================================================"
""" Colour-Schemes & Visual Settings
"============================================================================"

"""" Status Line
        set laststatus=2                             " always show statusbar
        set statusline=
        set statusline+=%-10.3n\                     " buffer number
        set statusline+=%f\                          " filename
        set statusline+=%h%m%r%w                     " status flags
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
        set statusline+=%=                           " right align remainder
        set statusline+=0x%-8B                       " character value
        set statusline+=%-14(%l,%c%V%)               " line, character
        set statusline+=%<%P                         " file position

set fillchars=diff:⣿

set background=dark

colorscheme gruvbox

autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

""" Syntax highlighting on by default
syntax on

""" Relative line numbers on by default
set number
set relativenumber """ rnu

""" Toggle relative line numbers
noremap <C-N> :if (!&number && !&relativenumber)<CR>
              \set number \| set relativenumber<CR>
              \else <CR>
              \set nonumber \| set norelativenumber<CR>
              \endif<CR><CR>


set colorcolumn=+1

""" Don't wrap lines by default
set nowrap

""" Toggle line wrapping
noremap yow :set wrap!<CR>

set cursorline

""" Window Arrangment
set diffopt+=vertical

set splitright
set splitbelow

""" Netrw Directory Listing

let g:netrw_altv=1

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

""" Autoread
set autoread

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
