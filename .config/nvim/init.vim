""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (managed with `junegunn/vim-plug`) 
call plug#begin('~/.vim/plugs')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'morhetz/gruvbox'
" Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'
" ^Requires prettier
Plug 'w0rp/ale'
" ^Requires eslint
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe'
Plug 'rking/ag.vim'
call plug#end()
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General 
noremap <space> :
let mapleader=","

set nocompatible
set fileformat=unix
set shell=bash
set noswapfile
set hidden
set autoindent

" Indent using spaces instead of tabs
set expandtab

" The number of spaces to use for each indent
set shiftwidth=2
set tabstop=2

" Number of spaces to use for a <Tab> during editing operations
set softtabstop=2

" Highlight search matches
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Line numbers
:set number
:set nu
:set relativenumber

" Mappings for moving lines and preserving indentation
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Mappings for navigating split screen
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" `jj` to exit insert
:imap jj <Esc>

" Quick copy to new file 
vnoremap <C-y> :'<,'>w %:h/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git mappings
:command GS Gstatus
:command GC Gcommit -v
:command GCA Gcommit --amend
:command GD Gdiff
:command GA Gwrite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
set termguicolors
colo gruvbox
" set bg=dark
" let ayucolor="mirage"
" colo ayu
" colo slate
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter
nnoremap = :Prettier<CR>
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

" Use babylon parser with prettier
let g:prettier#config#parser="babylon"

" Run prettier asynchronously before saving
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Use JSON in .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" React
" Allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" Excluded dirs
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSpace 
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

noremap ,, :tabp <CR>
noremap .. :tabn <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag 
let g:ag_working_path_mode="r"
noremap // :Ag 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
" Move up and down suggestions with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

filetype plugin on
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1

