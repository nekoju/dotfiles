call plug#begin('~/.config/nvim/plugged/')
Plug 'andymass/vim-matchup'
Plug 'chrisbra/csv.vim'
" Plug 'dag/vim-fish'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elzr/vim-json'
Plug 'fs111/pydoc.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'khaveesh/vim-fish-syntax'
Plug 'Konfekt/FastFold'
Plug 'lervag/vimtex'
"" Why won't this work?
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mpjuers/showcontext'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'neovim/nvim-lspconfig'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rstacruz/vim-closer'
"" To set up later
" Plug 'spinks/vim-leader-guide'
" Pragmatic folding for .py
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'wesQ3/vim-windowswap'
Plug 'w0rp/ale'
call plug#end()

if &shell =~# 'fish$'
    set shell=sh
endif

let g:slime_target="neovim"
xmap <Space> <Plug>SlimeRegionSend
nmap <Space> <Plug>SlimeParagraphSend

let g:slime_target="neovim"
xmap <Space> <Plug>SlimeRegionSend
nmap <Space> <Plug>SlimeParagraphSend

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" remap Omni completion
inoremap <leader>xx <C-X><C-O>
inoremap <leader>xf <C-X><C-F>

" Use neovim-remote as git editor
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif

let g:python3_host_prog = "/Users/mpjuers/.pyenv/versions/neovim3/bin/python"

let $VIMHOME = expand('<sfile>:p:h')

" Surround mappings
inoremap (( ()<esc>i
inoremap [[ []<esc>i
inoremap {{ {}<esc>i
inoremap << <><esc>i
inoremap ** **<esc>i
inoremap "" ""<esc>i
inoremap '' ''<esc>i
imap <leader>aa <esc>]%a
imap <leader>bb <esc>[%i
nmap <leader>aa <esc>]%
nmap <leader>bb <esc>[%

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

nnoremap <silent> <C-n> :set relativenumber!<cr>

" go row-wise rather than line-wise
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" window
" new window takes up entire width/height of screen
nmap <silent> <leader>swh :topleft  vnew<CR>
nmap <silent> <leader>swl :botright vnew<CR>
nmap <silent> <leader>swk :topleft  new<CR>
nmap <silent> <leader>swj :botright new<CR>

" buffer
" new window takes up half of current window width/height
nmap <silent> <leader>sh :leftabove vnew<CR>
nmap <silent> <leader>sl :rightbelow vnew<CR>
nmap <silent> <leader>sk :leftabove new<CR>
nmap <silent> <leader>sj :rightbelow new<CR>


" Word count for latex
noremap <silent> <F3> :w !detex \| wc -w<CR>
" show open buffers with f5
noremap <silent> <F5> :buffers<CR>:buffer<Space>
" open term window
noremap <silent> <leader>tj :belowright new \| resize 15 \| set wfh \| term<CR>
noremap <silent> <leader>twj :botright new \| resize 15 \| set wfh \| term<CR>
noremap <silent> <leader>twl :botright vnew \| vertical resize 80 \| set wfw \| term<CR>

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

" " for completion menu
" inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"             \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

nnoremap <leader>lc :call ShowContext_toggle()<CR>

" Switch black on and off.
let g:black_running = 0
function! Toggle_black_running()
    if g:black_running == 0
        let g:black_running = 1
        augroup BlackRunning
            autocmd!
            autocmd! BufWritePost *.py execute ':!black -l 79 %'
        augroup END
        echo 'Black on'
    else
        let g:black_running = 0
        autocmd! BlackRunning
        echo 'Black off'
    endif
endfunction
noremap <leader>bl :call Toggle_black_running()<CR>

" Puts output of :read inline rather than on a new line.
fu! InlineRead(command)
    let colnum = col('.')
    let line = getline('.')
    call setline('.', strpart(line, 0, colnum) . system(a:command) . strpart(line, colnum))
endfu

command! -nargs=1 IRead call InlineRead(<f-args>)
let g:pandoc#keyboard#use_default_mappings = 0

" Switching windows
" In terminal
tnoremap <leader>hh <C-\><C-N><C-w>h
tnoremap <leader>jj <C-\><C-N><C-w>j
tnoremap <leader>kk <C-\><C-N><C-w>k
tnoremap <leader>ll <C-\><C-N><C-w>l
" In insert mode
inoremap <leader>hh <C-]><C-w>h
inoremap <leader>jj <C-]><C-w>j
inoremap <leader>kk <C-]><C-w>k
inoremap <leader>ll <C-]><C-w>l
" In normal mode
nnoremap <leader>hh <C-w>h
nnoremap <leader>jj <C-w>j
nnoremap <leader>kk <C-w>k
nnoremap <leader>ll <C-w>l

" fzf mappings
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }
nnoremap <C-p><C-p> :ProjectFiles<CR>
inoremap <C-p><C-p> :ProjectFiles<CR>
nnoremap <C-p><C-f> :Ag<CR>
nnoremap <C-p><C-b> :Buffers<CR>
nnoremap <C-p><C-m> :Marks<CR>
nnoremap <C-m><C-w> :Windows<CR>
nnoremap <C-p><C-h> :History:<CR>
nnoremap <C-s><C-s> :Snippets<CR>
nnoremap <C-p><C-c> :Commits<CR>
nnoremap <C-p><C-a> :BCommits<CR>
nnoremap <leader>ph :Helptags<CR>
nnoremap <C-f> :Tags<CR>

" two-key find

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
let g:sh_fold_enabled = 5

" bash-style command completion
set wildmode:longest,list
set nowildmenu

filetype plugin on
set breakindent
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
set formatoptions-=c formatoptions-=r formatoptions-=o
syntax on
syntax enable
set t_Co=256
set background=dark
colorscheme palenight

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

set shortmess+=F


autocmd BufEnter * silent! lcd %:p:h
augroup vimrc
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd FileType rmd setlocal commentstring=#%s
    autocmd FileType cpp setlocal commentstring=//%s
    autocmd FileType tex setlocal spell spelllang=en_us
    autocmd FileType py nnoremap K :execute "!pydoc " . expand("")
    " fix misbehavior after buffer deletion
    " unfortunately this seems to break help
    " autocmd BufDelete * tabdo windo wincmd + | wincmd >
    autocmd BufEnter term://* wincmd + | wincmd - | wincmd < | wincmd >
augroup

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

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'GFiles' s:find_git_root()

autocmd FileType crontab setlocal nobackup nowritebackup

augroup Snakemake
    autocmd!
    au BufNewFile,BufRead Snakefile set syntax=snakemake
    au BufNewFile,BufRead *.snake set syntax=snakemake
augroup END

" I need to figure out what problem this was trying to solve.
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

autocmd! BufRead "*.md" :set linewidth=80
autocmd! BufWritePre "*.md" :execute "normal! mygggqG'y"

" set laststatus=2
" set noshowmode
" " status bar colors
" au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
" au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
" hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%5*\ %{FugitiveHead()}\ 
set statusline+=%3*

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
hi User5 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#8FBCBB

augroup Closer
    au!
    au FileType r,rmd
        \ let b:closer = 1 |
        \ let b:closer_flags = '([{'
augroup END


" let g:indent_blankline_char = '|'
" language server stuff

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
