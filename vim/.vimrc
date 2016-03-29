call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'othree/html5.vim'
Plug  'dag/vim-fish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jez/vim-superman'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'exu/pgsql.vim'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
call plug#end()
syntax enable
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set textwidth=89
set showcmd
set showmatch
set langnoremap
set incsearch
set hlsearch
set wildmenu
set lazyredraw
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set shell=/bin/bash
let mapleader=","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|tmp|build|report)$'
let g:jsx_ext_required = 0
let g:sql_type_default = 'pgsql'
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
" highlight last inserted text
nnoremap gV `[v`]
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <leader>s :mksession!<cr>
set number
set relativenumber
set cursorline
let base16colorspace=256
set background=light
colorscheme base16-apathy
