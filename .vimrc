""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins (managed with `junegunn/vim-plug`)
call plug#begin('~/.vim/plugs')
" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" find
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'bronson/vim-visual-star-search'
" Plug 'wincent/loupe'

" ui
" Plug 'TaDaa/vimade'
Plug 'itchyny/lightline.vim'
" Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" themes
Plug 'cideM/yui'
Plug 'gruvbox-community/gruvbox'
Plug 'morhetz/gruvbox'
Plug 'robertmeta/nofrils'
Plug 'jaredgorski/fogbell.vim'
Plug 'junegunn/seoul256.vim'
" Plug 'flazz/vim-colorschemes'

" syntax
" requires prettier install
Plug 'prettier/vim-prettier'
" syntax highlight ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'

" autocomplete/suggest (requires language extensions)
" eg. `:CocInstall coc-tsserver coc-json coc-html coc-css`
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'zivyangll/git-blame.vim'
Plug 'airblade/vim-gitgutter'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" nerdtree
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" misc
" Plug 'rizzatti/dash.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'machakann/vim-highlightedyank'
" Plug 'junegunn/vim-emoji'
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
" abbreviations
" iabbrev AND &amp;
" iabbrev SPACE &nbsp;
" iabbrev GT &gt;
" iabbrev LT &lt;
" iabbrev COPY &copy;
" iabbrev INFIN &infin;
" iabbrev APOS &apos;
" iabbrev QUOT &quot;
" iabbrev RIQ &raquo;
" iabbrev LIQ &laquo;

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
" noremap <silent> <leader>/ :noh<CR>
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

" show syntax highlight groups for word under cursor
" nmap <leader>? :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

" plugins
noremap <silent> <leader><CR> :Goyo<CR>
noremap <silent> <leader>t :to vs .<CR>
noremap <leader>g :Gstatus<CR>
nnoremap <leader>G :<C-u>call gitblame#echo()<CR>
noremap <silent> <leader>p :Prettier<CR>
noremap <silent> <leader>d :Dash<CR>
noremap <silent> <leader>D :Dash!<CR>
noremap <silent> <leader>O :OR<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git
command GS Gstatus
command GC Gcommit -v
command GCA Gcommit --amend
command GD Gvdiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
if has('termguicolors')
  set termguicolors
endif

colorscheme yui
" execute 'colorscheme ' . (is_day == 1 ? 'seoul256-light' : 'seoul256')
" execute 'colorscheme ' . (is_day == 1 ? 'gruvbox' : 'fogbell')
" execute 'set bg=' . (is_day == 1 ? 'light' : 'dark')

set colorcolumn=81
" if exists('+colorcolumn')
"   " highlight up to 255 chars
"   let&l:colorcolumn='+'.join(range(0, 254), ',+')
" endif

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
" noremap <leader>T :NERDTreeToggle<CR>
" let NERDTreeShowHidden=1
" let NERDTreeIgnore=['^node_modules$']

" let g:NERDTreeDirArrowExpandable = '⤳'
" let g:NERDTreeDirArrowCollapsible = '↘︎'

" let g:NERDTreeIndicatorMapCustom = {
"   \ "Modified"  : "M",
"   \ "Staged"    : "✚",
"   \ "Untracked" : "U",
"   \ "Renamed"   : "R",
"   \ "Unmerged"  : "═",
"   \ "Deleted"   : "D",
"   \ "Dirty"     : "✗",
"   \ "Clean"     : "✔︎",
"   \ 'Ignored'   : 'I',
"   \ "Unknown"   : "?"
"   \ }

" augroup nerdtree
"   autocmd!
"   autocmd FileType nerdtree syntax clear NERDTreeFlags
"   autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
"   autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
"   autocmd FileType nerdtree setlocal conceallevel=3
"   autocmd FileType nerdtree setlocal concealcursor=nvic
" augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emoji
let g:gitgutter_sign_added = "✚"
let g:gitgutter_sign_modified = "M"
let g:gitgutter_sign_removed = "D"
" let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
" let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
" let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
" let g:gitgutter_sign_modified_removed = emoji#for('collision')

" :Emoji to replace emoji codes
" augroup emoji_complete
"   autocmd!
"   autocmd FileType markdown setlocal completefunc=emoji#complete
"   command! -nargs=* Emoji %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
" augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" linter
let g:prettier#config#parser="typescript"

" run on save
" let g:prettier#autoformat=0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" JSON for .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
" nnoremap // :Rg!<CR>
" nnoremap <silent> <c-p> :GFiles! --others<CR>
" nnoremap <silent> <c-P> :Files!<CR>
" nnoremap <silent> <c-space> :Buffers!<CR>
" nnoremap <silent> <c-p>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" react
" allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" goyo
" let g:goyo_width=80
" let g:goyo_height='95%'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlighted yank
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 300
highlight HighlightedyankRegion cterm=reverse gui=reverse

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loupe
" nmap <leader>/ <Plug>(LoupeClearHighlight)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown preview
" let g:mkdp_page_title = '「${name}」'
" open preview when entering md buffer
" let g:mkdp_auto_start = 1
" refresh on save or leaving insert mode
" let g:mkdp_refresh_slow = 1
" let g:mkdp_echo_preview_url = 1

" let g:mkdp_preview_options = {
"   \ 'disable_sync_scroll': 0,
"   \ 'sync_scroll_type': 'middle',
"   \ 'hide_yaml_meta': 1,
"   \ 'content_editable': v:false
"   \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimade
" let g:vimade = {}
" let g:vimade.fadelevel = 0.7
" let g:vimade.enablefocusfading = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" limelight
" let g:limelight_priority = -1

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" imports
source ~/.vim/coc-config.vim
source ~/.vim/colors.vim
