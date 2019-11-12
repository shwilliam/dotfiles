""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (managed with `junegunn/vim-plug`)
call plug#begin('~/.vim/plugs')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'

Plug 'mileszs/ack.vim'

" requires prettier install
Plug 'prettier/vim-prettier'

Plug 'mxw/vim-jsx'

" autocomplete/suggest
" requires language extensions
" eg. `:CocInstall coc-tsserver coc-json coc-html coc-css`
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax highlight ts
Plug 'HerringtonDarkholme/yats.vim'

Plug 'rizzatti/dash.vim'

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" Plug 'vim-scripts/wombat256.vim'
" Plug 'sjl/badwolf'
" Plug 'tpope/vim-vividchalk'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
set nocompatible
set fileformat=unix
set shell=bash
set noswapfile
set nobackup
set nowritebackup
set hidden
set autoindent
set foldmethod=indent
set foldlevel=2
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" search
set hlsearch
set incsearch
set showmatch
set smartcase
" set ignorecase

" line numbers
:set number
:set nu
:set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings
noremap ; :
noremap <Tab> %

" leader
let mapleader=","
nmap <space> ,

noremap <leader>w :w<CR>
noremap <leader>wq :wq<CR>
noremap <leader>q :q<CR>
noremap <leader>q! :q!<CR>
noremap <leader>qa :qa<CR>
noremap <leader>qa! :qa!<CR>
noremap <leader>h ^
noremap <leader>l $
noremap <leader>R :%s/
" unhighlight search matches
noremap <leader>/ :noh<CR>
nnoremap <leader>a :Ack!<Space>-i<Space>--ignore-dir={node_modules,.cache,public,build,dist}<Space>--ignore-file=match:/-lock.json/<Space>
nmap <leader>c gcc
noremap <leader>b :b#<CR>
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>g :Gstatus<CR>
nnoremap <leader>G :<C-u>call gitblame#echo()<CR>
noremap <leader>P :Prettier<CR>
noremap <leader>d :Dash<CR>
noremap <leader>D :Dash!<CR>

" navigate split
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" navigate tabs
noremap ,, :tabp<CR>
noremap .. :tabn<CR>

" `jj` to exit insert
:imap jj <Esc>

" move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
:command GS Gstatus
:command GC Gcommit -v
:command GCA Gcommit --amend
:command GD Gdiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
set termguicolors
set bg=dark

" colo gruvbox
" let g:gruvbox_contast_dark = 'soft'

let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '000000', 'guibg': '83a598',
\              'ctermfg': '000000', 'ctermbg': '83a598',
\              'attr': 'bold' },
\    'Comment': { 'guifg': '458588' },
\    'background': { 'guibg': '282828' },
\}
colo jellybeans

" colo wombat256mod
" colo badwolf
" colo vividchalk

set colorcolumn=71

" insert chars at tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

let g:lightline = {
 \    'colorscheme': 'jellybeans',
 \    'active': {
 \      'left': [
 \        [ 'mode', 'paste' ],
 \      [ 'gitbranch', 'readonly', 'filename', 'modified' ]
 \    ]
 \  },
 \    'component_function': {
 \    'gitbranch': 'fugitive#head'
 \  },
 \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^node_modules$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter
nnoremap = :Prettier<CR>
let g:prettier#config#parser="babylon"
" run on save
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" JSON for .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'node_modules/']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
cnoreabbrev Ack Ack!
noremap // :Ack!<Space>-i<Space>--ignore-dir={node_modules,.cache,public,build,dist}<Space>--ignore-file=match:/-lock.json/<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" React
" allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
" navigate suggestions with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

set cmdheight=2
set updatetime=300
" always show signcolumns
set signcolumn=yes
" no |ins-completion-menu| messages
set shortmess+=c

" tab to complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <c-space> trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" k to show documentation in prev window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" rename current word
nmap <leader>r <Plug>(coc-rename)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" status line support for integration with other plugin
" (:h coc-status)
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" find in current document
nnoremap <silent> <space>s  :<C-u>CocList outline<cr>
" find in workspace
nnoremap <silent> <space>S  :<C-u>CocList -I symbols<cr>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
