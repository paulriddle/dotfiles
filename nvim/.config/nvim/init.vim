" Install vim-plug if it doesn't exist yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'danro/rename.vim'
Plug 'easymotion/vim-easymotion'
Plug 'exu/pgsql.vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'jez/vim-superman'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'kballard/vim-fish'
Plug 'mhinz/vim-grepper'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
call plug#end()

syntax enable
filetype plugin indent on
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set smartindent
set textwidth=114
set showcmd
set showmatch
set langnoremap
set incsearch
set hlsearch
set wildmenu
set lazyredraw
set foldenable
set ruler
set rulerformat=%-14.(%c%V%)\ %P
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set shell=/bin/bash
set autowrite

" Line numbers and current line settings
set number
set relativenumber
set cursorline

let mapleader=","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|tmp|build|report)$'
let g:jsx_ext_required = 0
let g:sql_type_default = 'pgsql'
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>a :CtrlP app<cr>
nnoremap <leader>s :CtrlP spec<cr>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>v :source $MYVIMRC<cr>
nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
" highlight last inserted text
nnoremap gV `[v`]
nnoremap <C-n> :lnext<cr>
nnoremap <C-b> :lprevious<cr>
autocmd FileType go nmap <leader>b :<C-u>call <sid>build_go_files()<cr>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>r <Plug>(go-run)
let base16colorspace=256
colorscheme base16-railscasts

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
