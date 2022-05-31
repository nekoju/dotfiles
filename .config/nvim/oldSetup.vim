call plug#begin('~/.config/nvim/plugged')
" Plug 'kopischke/vim-stay' " This isn't working properly for some reason
" Plug 'vim-syntastic/syntastic'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
Plug 'fs111/pydoc.vim'
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/Nvim-R'
" Plug 'jeffkreeftmeijer/vim-dim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
" Plug 'kana/vim-submode'
" Plug 'kchmck/vim-coffee-script'
Plug 'Konfekt/FastFold'
Plug 'lervag/vimtex' Plug 'mpjuers/showcontext'
Plug 'python/black'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neosnippet.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" Plug 'vim-voom/VOoM'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'wesQ3/vim-windowswap'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
" Plug 'zchee/deoplete-jedi'
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'roxma/vim-hug-neovim-rpc'
"   Plug 'roxma/nvim-yarp'
"   Plug 'Shougo/deoplete.nvim'
" endif
" Plug 'tmux-plugins/vim-tmux-focus-events'
call plug#end()

let g:python3_host_prog = "/Users/mpjuers/.pyenv/versions/neovim3/bin/python"

let $VIMHOME = expand('<sfile>:p:h')
source $VIMHOME/pluginOptions.vim
source $VIMHOME/optionsAndVariables.vim
source $VIMHOME/autocommands.vim
source $VIMHOME/mappings.vim
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>	


" for automatic reloading of changed files
autocmd FocusGained,BufEnter * :silent! !
autocmd FocusLost,WinLeave * :silent! noautocmd w


" automatically set working directory to current file

autocmd BufEnter * silent! lcd %:p:h

nnoremap <silent> <C-n> :set relativenumber!<cr>

" go row-wise rather than line-wise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" popup menu for spelling
nnoremap z= ea<C-X><C-S>

" window
" new window takes up entire width/height of screen
nmap <silent> <leader>swh  :topleft  vnew<CR>
nmap <silent> <leader>swl :botright vnew<CR>
nmap <silent> <leader>swk    :topleft  new<CR>
nmap <silent> <leader>swj  :botright new<CR>

" buffer
" new window takes up half of current window width/height
nmap <silent> <leader>sh   :leftabove  vnew<CR>
nmap <silent> <leader>sl  :rightbelow vnew<CR>
nmap <silent> <leader>sk     :leftabove  new<CR>
nmap <silent> <leader>sj   :rightbelow new<CR>

" move from terminal mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" insert newline after and before enclosing braces
nmap <expr> <leader>(( getline(".")[col(".")-1] == "(" ? 'a<CR><esc>?(<CR>%i<CR><esc>' : ''


noremap <silent> <F3> :w !detex \| wc -w<CR>
" show open buffers with f5
noremap <silent> <F5> :buffers<CR>:buffer<Space>
" open term window
noremap <silent> <leader>tj :belowright new \| resize 15 \| set wfh \| term<CR> 
noremap <silent> <leader>twj :botright new \| resize 15 \| set wfh \| term<CR>
noremap <silent> <leader>twl :botright vnew \| vertical resize 80 \| set wfw \| term<CR>

let w:locallist_open = 0
function! Toggle_locallist()
    if w:locallist_open == 0
        let w:locallist_open = 1
        lopen
        wincmd p
    else
        let w:locallist_open = 0
        lclose
    endif
endfunction
nnoremap <leader>lo :call Toggle_locallist()<CR>

command! WQtab wincmd j | w | windo bd
command! Qtab windo bd
function! PythonAddTags(module)
    let l:commandstring = "python -c \"import os; import " . a:module 
                \ . "; print(os.path.dirname(" . a:module . "\.__file__))\""
    let l:dir = system(l:commandstring)[:-2]
    let l:call = "ctags -R " . l:dir
    call system(l:call)
    let &tags .= "\ " . l:dir . "/tags"
endfunction
command! -nargs=1 Addtags call PythonAddTags(<f-args>)

" latex to docx
map <F8> :w !pandoc -o %.docx <CR>

" for completion menu
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

nnoremap <leader>lc :call ShowContext_toggle()<CR>

let g:black_running = 0
function! Toggle_black_running()
    if g:black_running == 0
        let g:black_running = 1
        augroup BlackRunning
            autocmd!
            autocmd! BufWritePre *.py execute ':Black'
        augroup END
		echo 'Black on'
    else
        let g:black_running = 0
        autocmd! BlackRunning
		echo 'Black off'
    endif
endfunction
nnoremap <leader>bl :call Toggle_black_running()<CR>

fu! InlineRead(command)
  let colnum = col('.')
  let line = getline('.')
  call setline('.', strpart(line, 0, colnum) . system(a:command) . strpart(line, colnum))
endfu

command! -nargs=1 IRead call InlineRead(<f-args>)

nnoremap <C-h> <C-\\><C-n><C-w>h
nnoremap <C-l> <C-\\><C-n><C-w>l
nnoremap <C-j> <C-\\><C-n><C-w>j
nnoremap <C-k> <C-\\><C-n><C-w>k
" statusline
" set laststatus=2
" set statusline=buff\ %n 	" buffer number
" set statusline+=\ ::\ 		" separator ' :: '
" set statusline+=%f 		" filename
" set statusline+=\ ::\ 		" separator ' :: '
" set statusline+=%y		" filetype
" set statusline+=%= 		" switch sides
" set statusline+=%{getcwd()}	" working dir


if has('nvim')
    let $VISUAL = 'nvr -cc split --remote-wait'
endif

set inccommand=nosplit
set expandtab
set shiftwidth=4
set tabstop=4


" folding
set foldmethod=syntax
let r_syntax_folding = 1
let g:tex_fold_enabled = 1
let g:vimtex_fold_envs = 1
let g:sh_fold_enabled = 5

" used for vim-stay
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']
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
" required for non-funkiness of solarized
" below required for solarized
" set background=dark
" let g:solarized_termtrans=1
" let g:solarized_termcolors=16
" if has("terminfo")
"   let &t_Co=16
"   let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
"   let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
" else
"   let &t_Co=16
"   let &t_Sf="\<Esc>[3%dm"
"   let &t_Sb="\<Esc>[4%dm"
" endif
" set t_Co=16 " for dim
colorscheme nord
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
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
augroup vimrc
    autocmd!
    autocmd FileType rmd setlocal omnifunc=CompleteR
    autocmd FileType make setlocal noexpandtab
    autocmd FileType rmd setlocal commentstring=#%s
    autocmd FileType cpp setlocal commentstring=//%s
    autocmd FileType tex setlocal spell spelllang=en_us
    autocmd FileType py nnoremap K :execute "!pydoc " . expand("")
    " fix misbehavior after buffer deletion
    " unfortunately this seems to break help
    " autocmd BufDelete * tabdo windo wincmd + | wincmd >
    autocmd BufEnter term://* wincmd + | wincmd - | wincmd < | wincmd >
augroup END

" " netrw: follow symlink and set working directory
" autocmd CursorMoved silent *
" " short circuit for non-netrw files
"             \ if expand('%:p') !~# '\.git'
"             \ if &filetype == 'netrw' |
"                 \ call FollowSymlink() |
"                 \ call SetProjectRoot() |
"             \ endif
" automatically follow symlinks

" Follow symlinked files
function! FollowSymlink()
    let current_file = expand('%:p')
    " check if file type is a symlink
    if getftype(current_file) == 'link'
        " if it is a symlink resolve to the actual file path
        "   and open the actual file
        let actual_file = resolve(current_file)
        silent! execute 'file ' . actual_file
    end
endfunction

" set working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
    " default to the current file's directory
    lcd %:p:h
    let git_dir = system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
    " if git project, change local directory to git project root
    if empty(is_not_git_dir)
        lcd `=git_dir`
    endif
endfunction

" follow symlink and set working directory
augroup Symlink
    autocmd!
    autocmd BufRead *
                \ if expand('%:p') !~# '\.git' |
                \ call FollowSymlink() |
                \ call SetProjectRoot()
augroup END

autocmd FileType crontab setlocal nobackup nowritebackup

augroup Snakemake
    autocmd!
    au BufNewFile,BufRead Snakefile set syntax=snakemake
    au BufNewFile,BufRead *.snake set syntax=snakemake
augroup END

function! SetTags(file)
    if filereadable(a:file)
        let &tags = " " . a:file . ";" . $HOME
    elseif filereadable("./tags")
        let &tags = " ./tags" . ";" . $HOME
    else
        return 0
    endif
endfunction

augroup Tags
    autocmd!
    autocmd VimEnter * call SetTags(trim(system("git rev-parse --show-toplevel")) . "/.tags")
    autocmd DirChanged * call SetTags(trim(system("git rev-parse --show-toplevel")) . "/.tags")
augroup END
