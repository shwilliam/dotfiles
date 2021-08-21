""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins (managed with `junegunn/vim-plug`)
call plug#begin('~/.vim/plugs')
" ui
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'

" themes
Plug 'junegunn/seoul256.vim'
Plug 'cideM/yui'
Plug 'gruvbox-community/gruvbox'
Plug 'morhetz/gruvbox'
Plug 'robertmeta/nofrils'
Plug 'jaredgorski/fogbell.vim'

" git
Plug 'zivyangll/git-blame.vim'
Plug 'airblade/vim-gitgutter'

" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" misc
Plug 'machakann/vim-highlightedyank'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utils
let is_day = (strftime('%H') < 20 && strftime('%H') > 5 ? 1 : 0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
set nocompatible
set fileformat=unix
set shell=bash
set noswapfile
set nobackup
set nowritebackup
set hidden
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set scrolloff=8
set cursorline
set noemoji
set mouse=a
filetype plugin on

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

if exists('&bellof')
  set bellof=all
endif

if has('linebreak')
  set breakindent
  let &showbreak='↳ '
  if exists('&breakindentopt')
    set breakindentopt=shift:2
  endif
endif

if has('folding')
  set foldmethod=indent
  set foldlevel=10
  if has('windows')
    set fillchars=diff:∙
    set fillchars+=fold:·
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" layout
if has('windows')
  set splitbelow
endif

if has('vertsplit')
  set splitright
endif

augroup autoLayout
  autocmd!
  autocmd VimResized * execute "normal! \<c-W>="
  autocmd VimEnter * autocmd WinEnter * let w:created=1
  autocmd VimEnter * let w:created=1
augroup END

" navigate split
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" resize splits
noremap <silent> <c-w>w :resize +5<CR>
noremap <silent> <c-w>s :resize -5<CR>
noremap <silent> <c-w>d :vertical resize +5<CR>
noremap <silent> <c-w>a :vertical resize -5<CR>

" rotate splits
noremap <silent> <c-w>r <c-w>R

" navigate tabs
noremap <silent> ,, :tabp<CR>
noremap <silent> .. :tabn<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spelling
set spelllang=en_us
augroup markdownSpell
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

if has('syntax')
  set spellcapcheck=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general mappings
let mapleader=" "

noremap <leader>w :w<CR>
noremap <leader>wq :wq<CR>
noremap <leader>q :q<CR>
noremap <leader>q! :q!<CR>
noremap <leader>qa :qa<CR>
noremap <leader>qa! :qa!<CR>
noremap <leader>R :%s/
" unhighlight search matches
noremap <silent> <leader>/ :noh<CR>
noremap <silent> <leader>b :b#<CR>
" yank to clipboard
vnoremap <silent> <C-c> "*y :let @+=@*<CR>

" `jj` to exit insert
inoremap jj <Esc>

" up/down arrows scroll
noremap <silent> <Up> <c-y>
noremap <silent> <Down> <c-e>

" move lines
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" git
nnoremap <leader>G :<C-u>call gitblame#echo()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
if has('termguicolors')
  set termguicolors
endif

set colorcolumn=81

" colorscheme gruvbox
" colorscheme yui
execute 'colorscheme ' . (is_day == 1 ? 'seoul256-light' : 'seoul256')
" execute 'colorscheme ' . (is_day == 1 ? 'gruvbox' : 'fogbell')

execute 'set bg=' . (is_day == 1 ? 'light' : 'dark')

" insert chars at tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
set listchars=nbsp:⦸
set listchars+=tab:▷┅
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•

let lightline_scheme = (is_day == 1) ? 'ayu_light' : 'seoul256'
let g:lightline = {
 \    'colorscheme': lightline_scheme,
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

let g:gitgutter_sign_added = "✚"
let g:gitgutter_sign_modified = "M"
let g:gitgutter_sign_removed = "D"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>

set completeopt=menuone,noinsert,noselect
" tab and s-tab for completion nav
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
" nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> ;; <cmd>Telescope buffers<cr>
" nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
