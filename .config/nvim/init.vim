""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (managed with `junegunn/vim-plug`)
call plug#begin('~/.vim/plugs')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vividchalk'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe'
" ^Follow https://github.com/ycm-core/YouCompleteMe#installation
Plug 'mattn/webapi-vim'
Plug 'w0rp/ale'
" ^Requires eslint
Plug 'prettier/vim-prettier'
" ^Requires prettier
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" ^Requires @typescript-eslint/parser
Plug 'posva/vim-vue'
" ^Requires eslint-plugin-vue
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/wombat256.vim'
" Plug 'sjl/badwolf'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
set nocompatible
set fileformat=unix
set shell=bash
set noswapfile
set hidden
set autoindent
set foldmethod=indent
set foldlevel=2
set expandtab
set shiftwidth=2
set tabstop=2
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings
noremap ; :
noremap <Tab> %

" Leader mappings
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
noremap <leader>H :tabp<CR>
noremap <leader>L :tabn<CR>
noremap <leader>j }
noremap <leader>k {
noremap <leader>r :%s/
" unhighlight search matches
noremap <leader>/ :noh<CR>
nnoremap <Leader>a :Ack!<Space>-i<Space>--ignore-dir={node_modules,.cache,public,build,dist}<Space>--ignore-file=match:/-lock.json/<Space>
nmap <leader>c gcc
noremap <leader>b :b#<CR>
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>g :Gstatus<CR>
nnoremap <Leader>G :<C-u>call gitblame#echo()<CR>
noremap <leader>o :CtrlSpace<CR>
noremap <leader>p :CtrlP<CR>
noremap <leader>P :Prettier<CR>

" Mappings for navigating split screen
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Mappings for navigating tabs
noremap ,, :tabp<CR>
noremap .. :tabn<CR>

" `jj` to exit insert
:imap jj <Esc>

" Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git commands
:command GS Gstatus
:command GC Gcommit -v
:command GCA Gcommit --amend
:command GD Gdiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
set termguicolors
set bg=dark
colo gruvbox
" colo wombat256mod
" colo vividchalk
" colo badwolf

set colorcolumn=71

" Inserts easy-to-read chars at tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

let g:lightline = {
 \    'colorscheme': 'wombat',
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
" Autocomplete
" Move up and down suggestions with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

filetype plugin on
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter
nnoremap = :Prettier<CR>
let g:ale_linters = {
 \  'javascript': ['eslint'],
 \  'typescript': ['tsserver', 'tslint'],
 \ }

let g:ale_fixers = {
 \  'javascript': ['eslint'],
 \  'typescript': ['prettier'],
 \ }

" Use babylon parser with prettier
let g:prettier#config#parser="babylon"

" Run prettier asynchronously before saving
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Use JSON in .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" Excluded dirs
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
" Allow JSX in .js files
let g:jsx_ext_required=0
