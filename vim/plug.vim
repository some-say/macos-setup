call plug#begin("~/.vim/plugged")

" General
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'terryma/vim-multiple-cursors'
Plug 'amix/vim-zenroom2'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'burke/matcher'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'git://github.com/jiangmiao/auto-pairs.git'

Plug 'editorconfig/editorconfig-vim'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" HTML
Plug 'vim-scripts/HTML-AutoCloseTag'

" Markdown
Plug 'tpope/vim-markdown', { 'for':'markdown' }

" JavaScript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}

" CSS
Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
Plug 'ap/vim-css-color', {'for': 'css'}
Plug 'cakebaker/scss-syntax.vim', {'for': 'sass'}

" JSX
Plug 'mxw/vim-jsx'

" HTML
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

" Syntax
" Plug 'vim-syntastic/syntastic'

call plug#end()
