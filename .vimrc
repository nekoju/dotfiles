" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'"
" Plug 'kopischke/vim-stay' " This isn't working properly for some reason
" Plug 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dag/vim-fish'
Plugin 'fs111/pydoc.vim'
Plugin 'jeffkreeftmeijer/vim-dim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'kana/vim-submode'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Konfekt/FastFold'
Plugin 'python/black'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'wesQ3/vim-windowswap'
Plugin 'Yggdroot/indentLine'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" "

" let g:python3_host_prog = "/N/u/mpjuers/Carbonate/.pyenv/versions/neovim3/bin/python"

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

" from https://vi.stackexchange.com/questions/20078/plugin-to-show-enclosing-indentation-levels/20089#20089
function! ShowContext() abort
  let items = []
  let l = line('.')
  let indent = 1000
  while l >= 0
    if indent(l) < indent && getline(l) != ''
      call add(items, getline(l))
      let indent = indent(l)
      if indent == 0
        break
      endif
    endif
    let l -= 1
  endwhile
  lgetexpr reverse(items)
endfunction

let w:contextlist_open = 0
function! Toggle_contextlist()
    if w:contextlist_open == 1
        let w:contextlist_open = 0
        autocmd! ContextList
        above lclose
    else
        let w:contextlist_open = 1
        augroup ContextList
            autocmd!
            autocmd CursorHold * call ShowContext()
        augroup END
        above lopen
        wincmd p
    endif
endfunction
nnoremap <leader>lc :call Toggle_contextlist()<CR>

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
autocmd BufRead *
            \ if expand('%:p') !~# '\.git' |
            \ call FollowSymlink() |
            \ call SetProjectRoot()

autocmd FileType crontab setlocal nobackup nowritebackup

autocmd BufWinEnter * let w:locallist_open = 0
autocmd BufWinEnter * let w:contextlist_open = 0

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

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
set tags=tags;$HOME
set mouse=a
set ttimeoutlen=10
set formatoptions+=cro

syntax on
syntax enable
" required for non-funkiness of solarized
" below required for solarized
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=16
if has("terminfo")
  let &t_Co=16
  let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
  let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
  let &t_Co=16
  let &t_Sf="\<Esc>[3%dm"
  let &t_Sb="\<Esc>[4%dm"
endif
set t_Co=16 " for dim
colorscheme nord
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" highlighting cursorline style
highlight! link Visual cursorline
" set bs=indent,eol,start
highlight clear SignColumn

" highlight search hits
set hlsearch
set completeopt=longest,menuone


" terminal autoscrolling
let g:neoterm_autoscroll=1

set conceallevel=0

set updatetime=400

" CtrlP-funky
nnoremap <C-f> :CtrlPFunky<Cr>
" Ctrl-] uses ctags if available, otherwise CtrlP-Funky
nnoremap <expr> <C-]> len(tagfiles()) > 0 ? "\<C-]>" : 
            \ "mT :execute 'CtrlPFunky ' . expand('<cword>')<Cr>"
" If tags are available, <C-T> functions as normal. Otherwise, return to
" mark set by <C-]>.
nnoremap <expr> <C-T> len(tagfiles()) > 0 ? "\<C-T>" : "'T"
let g:ctrlp_funky_after_jump = 'zvzz'
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_funky_multi_buffers = 1

" CtrlP

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor
                \ --hidden --follow --nocolor -g "" %s'
else
    let g:ctrlp_user_command = ['.git', 
                \ 'cd %s && git ls-files . -co --exclude-standard',
                \ 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

let g:ctrlp_map = '<C-p>' 
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_follow_symlinks = 1
" find .git and set to working directory
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/]\.git$',
            \ 'file': '\v\.pyc$', 
            \ }
let g:ctrlp_by_filename = 1
noremap <leader>bu :CtrlPBuffer<CR>

" submode
" A message will appear in the message line when you're in a submode
" " and stay there until the mode has existed.
let g:submode_always_show_submode = 1
"
" " We're taking over the default <C-w> setting. Don't worry we'll do
" " our best to put back the default functionality.
call submode#enter_with('window', 'n', '', '<C-w>')
call submode#enter_with('scroll', 'n', '', 's')
"
" Note: <C-c> will also get you out to the mode without this mapping.
" Note: <C-[> also behaves as <ESC>
call submode#leave_with('window', 'n', '', '<ESC>')
call submode#leave_with('scroll', 'n', '', '<ESC>')
"
" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
            \'n','o','p','q','r','s','t','u','v','w','x','y','z']
    " maps lowercase, uppercase and <C-key>
    call submode#map('window', 'n', '', key, '<C-w>' . key)
    call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
    call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor

" scroll bindings, make hjkl scroll half window
call submode#map('scroll', 'n', '', 'h', 'zH')
call submode#map('scroll', 'n', '', 'l', 'zL')
call submode#map('scroll', 'n', '', 'j', '<C-d>')
call submode#map('scroll', 'n', '', 'k', '<C-u>')

" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
    call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor
"
" Old way, just in case.
nnoremap <Leader>w <C-w>

" vim-python-pep8-indent
let python_pep8_indent_hang_closing = 0

" AutoPairs
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" Airline
let g:airline_theme='solarized'
let g:airline#extensions#ale#enabled = 1

" Fugitive
" Prevent opening of new tab with :Git command.
let g:fugitive_force_bang_command = 1

" Black
let g:black_linelength = 79

" IndentLine
let g:indentLine_enabled = 0

" lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
set laststatus=2
