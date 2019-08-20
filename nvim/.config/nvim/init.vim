call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'igankevich/mesonic'
Plug 'itchyny/lightline.vim'
Plug 'jez/vim-superman'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'kballard/vim-fish'
Plug 'lervag/vimtex'
Plug 'mattia72/vim-delphi'
Plug 'neoclide/coc.nvim', { 'do': './install.sh nightly' }
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
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
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType cpp setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType gitcommit setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType delphi setlocal ts=4 sts=4 sw=4 noexpandtab

set textwidth=80
autocmd FileType ruby setlocal textwidth=120
autocmd FileType eruby setlocal textwidth=120
autocmd FileType eruby.yaml setlocal textwidth=120

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

" Tabular
nnoremap <leader>t: :Tabularize /:<cr>
nnoremap <leader>t=> :Tabularize /=><cr>

" Do not highlight matching parens, it's annoying and showmatch is sufficient
let loaded_matchparen = 1

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

" Highlight current line
set cursorline

" Required by the colorscheme
set termguicolors
colorscheme plan9

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

" Lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }

" Show full path of filename
function! FilenameForLightline()
  return expand('%')
endfunction
" Disable INSERT mode display at the bottom, because lightline already shows it
set noshowmode

" fzf
nnoremap <leader>f :FZF<cr>
nnoremap <leader>bf :Buffers<cr>

let g:fzf_colors = {
      \ 'fg': ['fg', 'Debug'],
      \ }

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

let g:jsx_ext_required = 0

" Ale
nmap <silent> <f3> <Plug>(ale_next_wrap)
nmap <silent> <f4> <Plug>(ale_previous_wrap)
nmap <leader>gg <Plug>(ale_go_to_definition)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'c': ['clangd'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'c': ['clang-format']
      \ }

let g:ale_ruby_rubocop_options = '--config ~/.config/rubocop/ruby.yml --cache true'
let g:ale_c_clang_options = '-std=c17 -Wall'

" There is another python on my system at /bin/python, so I set this variable to
" avoid confusion
let g:python3_host_prog = '/usr/bin/python'

" coc.nvim
" Tab to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ultisnips
let g:UltiSnipsExpandTrigger = '<c-q>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
