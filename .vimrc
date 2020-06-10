""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (managed with `junegunn/vim-plug`)
call plug#begin('~/.vim/plugs')
Plug 'kien/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
" Plug 'terryma/vim-multiple-cursors'
" autocomplete/suggest (requires language extensions)
" eg. `:CocInstall coc-tsserver coc-json coc-html coc-css`
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
" requires prettier install
Plug 'prettier/vim-prettier'
Plug 'rizzatti/dash.vim'
Plug 'mxw/vim-jsx'
" syntax highlight ts
Plug 'HerringtonDarkholme/yats.vim'

" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'robertmeta/nofrils'
Plug 'jaredgorski/fogbell.vim'
" Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
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
set number
set nu
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General mappings
let mapleader=" "

noremap <leader>w :w<CR>
noremap <leader>wq :wq<CR>
noremap <leader>q :q<CR>
noremap <leader>q! :q!<CR>
noremap <leader>qa :qa<CR>
noremap <leader>qa! :qa!<CR>
noremap <leader>R :%s/
" unhighlight search matches
noremap <leader>/ :noh<CR>
noremap <leader>b :b#<CR>
" yank to clipboard
vnoremap <C-c> "*y :let @+=@*<CR>

" navigate split
nmap <C-H> <C-w>h
nmap <C-J> <C-w>j
nmap <C-K> <C-w>k
nmap <C-L> <C-w>l

" navigate tabs
noremap ,, :tabp<CR>
noremap .. :tabn<CR>

" `jj` to exit insert
imap jj <Esc>

" move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" plugins
noremap <leader><CR> :Goyo<CR>
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>g :Gstatus<CR>
nnoremap <leader>G :<C-u>call gitblame#echo()<CR>
noremap <leader>p :Prettier<CR>
noremap <leader>d :Dash<CR>
noremap <leader>D :Dash!<CR>
noremap <leader>O :OR<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
command GS Gstatus
command GC Gcommit -v
command GCA Gcommit --amend
command GD Gdiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
set termguicolors

execute 'colorscheme ' . (strftime('%H') < 20 && strftime('%H') > 5 ? 'fogbell_light' : 'fogbell')

" colo nofrils-light

" colo gruvbox
" execute 'set bg=' . (strftime('%H') < 20 && strftime('%H') > 5 ? 'light' : 'dark')

" colo rest

set colorcolumn=81

" insert chars at tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

let g:lightline = {
 \    'colorscheme': 'one',
 \    'active': {
 \      'left': [
 \        [ 'mode', 'paste' ],
 \        [ 'gitbranch', 'readonly', 'filename', 'modified' ],
 \      ],
 \      'right': [
 \        [ 'lineinfo' ],
 \        [ 'fileformat', 'fileencoding'],
 \      ],
 \    },
 \    'component_function': {
 \      'gitbranch': 'fugitive#head'
 \    },
 \  }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^node_modules$']

" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "M",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "U",
"     \ "Renamed"   : "R",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "D",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : 'I',
"     \ "Unknown"   : "?"
"     \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter
let g:prettier#config#parser="typescript"

" run on save
" let g:prettier#autoformat=0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

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
" Goyo
let g:goyo_width=80
let g:goyo_height='95%'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Multi-cursor
" let g:multi_cursor_use_default_mapping=0

" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-m>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

source ~/.vim/coc.vim
source ~/.vim/colors.vim
