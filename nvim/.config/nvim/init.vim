call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'othree/html5.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jez/vim-superman'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'mhinz/vim-grepper'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'exu/pgsql.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'kballard/vim-fish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
call plug#end()
syntax on
filetype plugin indent on
" ------------------------
" Tab settings
set expandtab
set tabstop=2 "     ts
set softtabstop=2 " sts
set shiftwidth=2 "  sw
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
" ------------------------
set smartindent
set textwidth=88
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
set autowrite " so that I don't have to call :w before GoBuild, make, etc.
let mapleader=","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|tmp|build|report)$'
let g:jsx_ext_required = 0
let g:sql_type_default = 'pgsql'
"-------------------------------------------------------------------------
" Moving around
"-------------------------------------------------------------------------
" replace ^ and $ with B and E
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
" Move between split windows.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"--------------------------------------------
nnoremap <leader>f :CtrlP<cr>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <space> za
nnoremap j gj
nnoremap k gk
"-------------------------------------------------------------------------
nnoremap <leader>s :mksession!<cr>
"-------------------------------------------------------------------------
" Golang
"-------------------------------------------------------------------------
autocmd FileType go nmap <leader>b :<C-u>call <sid>build_go_files()<cr>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>r <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
"-------------------------------------------------------------------------
" Visual settings
"-------------------------------------------------------------------------
set cursorline " highlight current line
set number " without it `relativenumber` shows 0 as current line number
set relativenumber
let base16colorspace=256 " required by the current colorscheme
colorscheme custom-light
"-------------------------------------------------------------------------
" Toggle invisible characters
nmap <leader>l :set list!<cr>
set listchars=tab:▸\ ,trail:-,nbsp:+
"-------------------------------------------------------------------------
" highlight last inserted text
nnoremap gV `[v`]
