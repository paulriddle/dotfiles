call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'othree/html5.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jez/vim-superman'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'exu/pgsql.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-rails'
Plug 'kballard/vim-fish'
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
let mapleader=","
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|tmp|build|report)$'
let g:jsx_ext_required = 0
let g:sql_type_default = 'pgsql'
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
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
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>
" highlight last inserted text
nnoremap gV `[v`]
nnoremap <leader>s :mksession!<cr>
nnoremap <leader>a :cclose<cr>
nnoremap <C-n> :lnext<cr>
nnoremap <C-b> :lprevious<cr>
autocmd FileType go nmap <leader>b :<C-u>call <sid>build_go_files()<cr>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>r <Plug>(go-run)
set number
set relativenumber
set cursorline
let base16colorspace=256
colorscheme base16-gruvbox-dark-soft

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
