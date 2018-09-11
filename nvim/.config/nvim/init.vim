call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'danro/rename.vim'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jez/vim-better-sml'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'lervag/vimtex'
Plug 'lervag/wiki'
Plug 'robertmeta/nofrils'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'whatyouhide/vim-lengthmatters'
call plug#end()

" Tab settings
set expandtab
set tabstop=2 "     ts
set softtabstop=2 " sts
set shiftwidth=2 "  sw
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c setlocal ts=4 sts=4 sw=4 noexpandtab

set textwidth=80
autocmd FileType ruby setlocal textwidth=120

set smartindent
" Jump to the matching bracket for 0.5 second when inserting new one
set showmatch
set lazyredraw
set rulerformat=%-14.(%c%V%)\ %P

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

set listchars=tab:▸\ ,trail:-,nbsp:+
set shell=/usr/bin/fish
" So that I don't have to call :w before GoBuild, make, etc.
set autowrite

" Leader is , reverse character search is \
let mapleader=","
nnoremap \ ,
let maplocalleader="_"

" Do not highlight matching parens, it's annoying and showmatch is sufficient
let loaded_matchparen = 1

" Sometimes I'm not fast enough and don't release shift when I should
command! W :w
command! E :e
command! Q :q

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
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-l> <c-\><c-n><c-w>l

" Exit terminal mode with esc
tnoremap <esc> <c-\><c-n>
" Don't forget about esc though, map it to alt-[
tnoremap <a-[> <esc>

" Highlight current line
set cursorline
" Without it `relativenumber` shows 0 as current line number
set number
set relativenumber

" Required by the current colorscheme
let base16colorspace=256
colorscheme nofrils-acme

" Toggle invisible characters
nnoremap <leader>l :set list!<cr>
" Clear search highlighting
nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <space> za

" Make j and k not ignore wrapped parts of lines
nnoremap j gj
nnoremap k gk

" Ergonomic escape
inoremap jk <esc>
inoremap <esc> <nop>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }
" Disable INSERT mode display at the bottom, because lightline already shows it
set noshowmode

" fzf
nnoremap <leader>f :FZF<cr>
nnoremap <leader>bf :Buffers<cr>

augroup ruby_mappings
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <leader>a :FZF app<cr>
  autocmd FileType ruby nnoremap <buffer> <leader>s :FZF spec<cr>
augroup END

" YouCompleteMe
let g:ycm_filetype_blacklist = {
      \ 'fzf' : 1,
      \}
" Do not bother me with confirmation questions every time I open a file
let g:ycm_confirm_extra_conf = 0
" Default conf file for C
let g:ycm_global_ycm_extra_conf = '/home/riddle/\.ycm_extra_conf\.py'

nnoremap <leader>jd :YcmCompleter GoTo<cr>
nnoremap <leader>x :YcmCompleter FixIt<cr>

" vimtex
"
" neovim doesn't support --remote and compiled withut clientserver anyway, nvr
" is a tool written in python that serves as a workaround.
let g:vimtex_compiler_progname = 'nvr'
" Sometimes tex files detected as plaintext, this option prevents it
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

" Golang
let g:go_highlight_build_constraints = 1

augroup go_mappings
  autocmd!
  autocmd FileType go nnoremap <buffer> <leader>t :GoTestFunc<cr>
  autocmd FileType go nnoremap <buffer> <leader>bt :<C-u>call <sid>build_go_files()<cr>
  autocmd FileType go nmap <buffer> <leader>i <Plug>(go-imports)
  autocmd FileType go nmap <buffer> <leader>T <Plug>(go-test)
  autocmd FileType go nmap <buffer> <leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <buffer> <leader>r <Plug>(go-run)
augroup END

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Abbreviations
iabbrev TBA To be answered.
