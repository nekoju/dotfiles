if has('nvim')
    let $VISUAL = 'nvr -cc split --remote-wait'
endif

set inccommand=nosplit
" Tabs to spaces
set expandtab
set shiftwidth=4
set tabstop=4

" folding
set foldmethod=syntax
let r_syntax_folding = 1
let g:tex_fold_enabled = 1
let g:vimtex_fold_envs = 1
let g:sh_fold_enabled = 5

" bash-style command completion
set wildmode:longest,list
set nowildmenu

filetype plugin on
set breakindent
set omnifunc=syntaxcomplete#Complete
set colorcolumn=80
set cursorline
set number
set linebreak
set ignorecase
set smartcase
set enc=utf8
set noruler
" shift-width
set sw=4
" switch between corresponding braces with %
let loaded_matchit=1
" don't unindent preprocessor directives
set cinkeys=0{,0},0),:,!^F,o,O,e
set noswapfile
set mouse=a
set ttimeoutlen=10
set formatoptions+=cro

syntax on
syntax enable
colorscheme nord

" highlighting cursorline style
highlight! link Visual cursorline

" set bs=indent,eol,start
highlight clear SignColumn

" highlight search hits
set hlsearch
set completeopt=longest,menuone

" if nvim is running open new edits with neovim remote
if has('nvim')
    let $VISUAL = 'nvr -cc split --remote-wait'
endif

" terminal autoscrolling
let g:neoterm_autoscroll=1

set conceallevel=0

set updatetime=400

let R_rmdchunk = '``'
