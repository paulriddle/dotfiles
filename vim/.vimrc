"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'dag/vim-fish'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jez/vim-superman'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'rking/ag.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fatih/vim-go'
NeoBundle 'exu/pgsql.vim'

call neobundle#end()

NeoBundleCheck
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General preferences
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set textwidth=89
set shell=/bin/bash
let mapleader=","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|tmp|build|report)$'
" Enable JSX syntax highlighting in .js files instead of only .jsx files
let g:jsx_ext_required = 0
" Set PostgreSQL syntax highlighting for all .sql files
let g:sql_type_default = 'pgsql'
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>f :CtrlP<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set cursorline
let base16colorspace=256
set background=dark
colorscheme base16-default
