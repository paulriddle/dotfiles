call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
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
Plug 'robertmeta/nofrils'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
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
" Disable annoying scratch window on autocompletion
set completeopt-=preview

" Leader is , reverse character search is \
let mapleader=","
nnoremap \ ,
let maplocalleader="_"

" Do not highlight matching parens, it's annoying and showmatch is sufficient
let loaded_matchparen = 1

" Sometimes I'm not fast enough and don't release shift when I should
command! W :w
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

" Resize splits
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<cr>

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
set termguicolors
colorscheme nofrils-acme

" Toggle invisible characters
nnoremap <leader>l :set list!<cr>
" Clear search highlighting
nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <space> za

" Make j and k not ignore wrapped parts of lines
nnoremap j gj
nnoremap k gk

" Ergonomic escape
inoremap jk <esc>
inoremap <esc> <nop>

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

" I don't have 'sml' binary, so
let g:sml_smlnj_executable = '/usr/bin/smlnj'
let g:sml_auto_create_def_use = 'always'

augroup smlMaps
  au!
  au FileType sml nnoremap <leader>t :SMLTypeQuery<CR>
  au FileType sml nnoremap gd :SMLJumpToDef<CR>

  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>if :SMLReplBuild<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>
  au FileType sml nnoremap <silent> <buffer> <leader>iz :SMLReplShell<CR>
augroup END

" Ale
nmap <silent> <f3> <Plug>(ale_next_wrap)
nmap <silent> <f4> <Plug>(ale_previous_wrap)
" I don't like being disturbed while typing. Lint only on filesave.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'c': ['clangd'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'c': ['clang-format']
      \ }

" Deoplette
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/musl-clang')
call deoplete#custom#var('clangx', 'default_c_options', '-std=c17 -Wall')
