scriptencoding utf-8
set encoding=utf-8
set nocompatible
filetype off

" Theme
colorscheme zazen
"
" General
set number  " Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent    " Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2  " Number of auto-indent spaces
set smartindent   " Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab

set cursorline

" Advanced
set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Disable backups
set nobackup
set nowritebackup

" Special characters
set list

set listchars=eol:¬,tab:»·,trail:·,extends:>,precedes:<

set splitbelow
set splitright

" Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>

" Select all.
map <c-a> ggVG

" NERDTree open
map <C-\> :NERDTreeToggle<CR>

if filereadable(expand('~/.vim/plug.vim'))
  source ~/.vim/plug.vim
endif

let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.liquid,*.tag,*.jsp"
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|tmp\|vendor\|DS_Store\|git'
let NERDTreeIgnore=['node_modules', 'bower_components', 'tmp', 'vendor', '.DS_Store']

" vim-move configurations
let g:move_map_keys = 0
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <A-j> <Plug>MoveLineDown
nmap <A-k> <Plug>MoveLineUp

let g:airline_theme='raven'
