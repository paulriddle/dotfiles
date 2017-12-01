" Install vim-plug if it doesn't exist yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'exu/pgsql.vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'jez/vim-superman'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'kballard/vim-fish'
Plug 'mhinz/vim-grepper'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
call plug#end()

syntax on
filetype plugin indent on

" Tab settings
set expandtab
set tabstop=2 "     ts
set softtabstop=2 " sts
set shiftwidth=2 "  sw
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

set textwidth=88
autocmd FileType ruby setlocal textwidth=120

set smartindent
set showcmd
set showmatch " Jump to the matching bracket for 0.5 second when inserting new one
set langnoremap

set incsearch
set hlsearch

set wildmenu
set lazyredraw

set ruler
set rulerformat=%-14.(%c%V%)\ %P

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

set listchars=tab:▸\ ,trail:-,nbsp:+
set shell=/usr/bin/fish
set autowrite " so that I don't have to call :w before GoBuild, make, etc.

" Leader is , reverse character search is \
let mapleader=","
nnoremap \ ,

" Swap ^ and $ with B and E
nnoremap B ^
nnoremap E $
nnoremap ^ B
nnoremap $ E

" Move between split windows.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Exit terminal mode with esc
tnoremap <esc> <c-\><c-n>

set cursorline " highlight current line
set number " without it `relativenumber` shows 0 as current line number
set relativenumber

let base16colorspace=256 " required by the current colorscheme
colorscheme custom-light

" Toggle invisible characters
nmap <leader>l :set list!<cr>
" Clear search highlighting
nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>v :source $MYVIMRC<cr>
nnoremap <space> za

" Make j and k not ignore wrapped parts of lines
nnoremap j gj
nnoremap k gk

" CtrlP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|tmp|build|report)$'
nnoremap <leader>f :CtrlP<cr>
autocmd FileType ruby nnoremap <leader>a :CtrlP app<cr>
autocmd FileType ruby nnoremap <leader>s :CtrlP spec<cr>

" Golang
autocmd FileType go nmap <leader>b :<C-u>call <sid>build_go_files()<cr>
autocmd FileType go nmap <leader>i <Plug>(go-imports)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
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

let g:jsx_ext_required = 0
let g:sql_type_default = 'pgsql'
