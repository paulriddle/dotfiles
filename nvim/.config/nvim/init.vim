call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'robertmeta/nofrils'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()

" Tab settings
set expandtab
set tabstop=2     "  ts
set softtabstop=2 "  sts
set shiftwidth=2  "  sw
autocmd FileType go         setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType make       setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType c          setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType cpp        setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType gitcommit  setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType delphi     setlocal ts=4 sts=4 sw=4 noexpandtab

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

" Abbreviations
iabbrev --- -------------------------------------------------------------------------------

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

" Highlight current line
set cursorline
" Without it `relativenumber` shows 0 as current line number
set number
set relativenumber

" Required by the current colorscheme
set termguicolors
let base16colorspace=256
colorscheme nofrils-dark

" Toggle invisible characters
nnoremap <leader>l :set list!<cr>
" Clear search highlighting
nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <space> za

" Spellcheck
nnoremap <leader>o :setlocal spell! spelllang=en_us<cr>

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

" Ale
nmap <silent> <f3> <Plug>(ale_next_wrap)
nmap <silent> <f4> <Plug>(ale_previous_wrap)
nmap <leader>a <Plug>(ale_fix)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
let g:ale_linters = {
      \ 'ruby': [],
      \ 'c': [],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format']
      \ }
let g:ale_ruby_rubocop_options = '--config ~/.config/rubocop/ruby.yml --cache true'

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

" NOTE: not tested with SML
nmap <silent> gd <Plug>(coc-definition)

" Lightline
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }
" Show full path of filename
function! FilenameForLightline()
  return expand('%')
endfunction

" nvim-colorizer
lua require 'colorizer'.setup({'yaml';'vim';})
