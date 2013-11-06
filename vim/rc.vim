"
" vimrc by fs
"
set nocompatible
set encoding=utf-8
set modelines=0
set autoread
set visualbell
set noshowmode
set showcmd
set clipboard=unnamed
set mouse=a
set number
set relativenumber
set cursorline
set colorcolumn=80
set hidden
set splitbelow
set splitright
set title
set showmatch
set list
" set listchars+=eol:$
set nobackup
set noswapfile
set undofile
set wildmenu
set wildmode=longest,full


"" Whitespace
set autoindent
set copyindent
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab                  " use soft tabs (spaces)
set backspace=indent,eol,start " backspace through everything in insert mode
set textwidth=79

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

if filereadable(expand('~/.vim/bundles.vim'))
  filetype off

  source ~/.vim/bundles.vim
endif

set omnifunc=syntaxcomplete#Complete " completion stuff

" set background=dark
" colorscheme solarized

filetype plugin indent on
syntax on

if has("autocmd")
  " Enable file type detection

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType cpp        setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType c          setlocal ts=4 sts=4 sw=4 expandtab

  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " " NERDTree
  " autocmd vimenter * if !argc() | NERDTree | endif
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Seeing is Believing
  let g:xmpfilter_cmd = 'seeing_is_believing'

  autocmd FileType ruby nmap <buffer> <Leader>m <Plug>(seeing_is_believing-mark)
  autocmd FileType ruby xmap <buffer> <Leader>m <Plug>(seeing_is_believing-mark)
  autocmd FileType ruby imap <buffer> <Leader>m <Plug>(seeing_is_believing-mark)

  autocmd FileType ruby nmap <buffer> <Leader>M <Plug>(seeing_is_believing-clean)
  autocmd FileType ruby xmap <buffer> <Leader>M <Plug>(seeing_is_believing-clean)
  autocmd FileType ruby imap <buffer> <Leader>M <Plug>(seeing_is_believing-clean)

  autocmd FileType ruby nmap <buffer> <Leader>S <Plug>(seeing_is_believing-run_-x)
  autocmd FileType ruby xmap <buffer> <Leader>S <Plug>(seeing_is_believing-run_-x)
  autocmd FileType ruby imap <buffer> <Leader>S <Plug>(seeing_is_believing-run_-x)
endif

" enable powerline for airline
let g:airline_powerline_fonts = 1

" Enhance Netrw usability
let g:netrw_browse_split = 4
let g:netrw_altv = 1

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['scss'] = 'scss,css'

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Keymaps

let mapleader = ','

" default / to perl-style regexp's
nnoremap / /\v
vnoremap / /\v

" use tab to jump between matching brackets
map <Tab> %

" go from insert to normal mode
inoremap jj <Esc>:w<CR>
inoremap kk <Esc>:w<CR>

" disable arrows
noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap  <Right> <Nop>

" disable ex mode mapping
map Q <Nop>

" ahw, what the hell!
cnoreabbrev W w
cnoreabbrev Q q

" easier navigation between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" C-s will save us all!
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" remove highligted terms
nnoremap <Leader><Space> :noh<CR>

" delete trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" re-hardwrap text
nnoremap <Leader>q gqip

" reselect last pasted text
nnoremap <Leader>v V`]

" switch between the last two files
nnoremap <Leader>c <C-^>

map <Leader>n :NERDTreeToggle<CR>
map <Leader>, :tabedit $MYVIMRC<CR>
map <Leader>< :tabedit $MYGVIMRC<CR>

" gundo
nnoremap <Leader>u :GundoToggle<CR>

" vim rspec
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

call togglebg#map('<F5>')
