""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (managed with `junegunn/vim-plug`)
call plug#begin('~/.vim/plugs')
Plug 'kien/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'terryma/vim-multiple-cursors'

Plug 'mileszs/ack.vim'

" autocomplete/suggest
" requires language extensions
" eg. `:CocInstall coc-tsserver coc-json coc-html coc-css`
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'

" requires prettier install
Plug 'prettier/vim-prettier'

Plug 'rizzatti/dash.vim'

Plug 'mxw/vim-jsx'

" syntax highlight ts
Plug 'HerringtonDarkholme/yats.vim'

Plug 'itchyny/lightline.vim'

Plug 'morhetz/gruvbox'
Plug 'robertmeta/nofrils'
Plug 'jaredgorski/fogbell.vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'felixhummel/setcolors.vim'
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
nmap <leader>c gcc
noremap <leader>b :b#<CR>
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>g :Gstatus<CR>
nnoremap <leader>G :<C-u>call gitblame#echo()<CR>
noremap <leader>P :Prettier<CR>
noremap <leader>d :Dash<CR>
noremap <leader>D :Dash!<CR>
noremap <leader>O :OR<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
command GS Gstatus
command GC Gcommit -v
command GCA Gcommit --amend
command GD Gdiff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
set termguicolors

" colo fogbell_lite
" colo nofrils-dark

" colo gruvbox
" set bg=dark

colo nord

set colorcolumn=81

" insert chars at tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

let g:lightline = {
 \    'colorscheme': 'PaperColor',
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
nnoremap = :Prettier<CR>
let g:prettier#config#parser="typescript"
" run on save
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

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
nmap <silent> gt <Plug>(coc-type-definition)
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
" nnoremap <silent> <space>s  :<C-u>CocList outline<cr>
" find in workspace
" nnoremap <silent> <space>S  :<C-u>CocList -I symbols<cr>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-markdownlint',
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Multi-cursor
" let g:multi_cursor_use_default_mapping=0

" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-m>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme toggle
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
"   :SetColors now              (set scheme based on time of day)
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:mycolors = ['gruvbox', 'fogbell', 'fogbell_light', 'nofrils-dark', 'nofrils-light', 'nofrils-sepia']  " colorscheme names that we use to set color
" let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction

" next
" nnoremap <F8> :call NextColor(1)<CR>
noremap <leader>1 :call NextColor(1)<CR>
" prev
" nnoremap <S-F8> :call NextColor(-1)<CR>
noremap <leader>2 :call NextColor(-1)<CR>
" random
" nnoremap <A-F8> :call NextColor(0)<CR>
noremap <leader>3 :call NextColor(0)<CR>

