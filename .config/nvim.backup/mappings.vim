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
nmap <silent> <leader>sh :leftabove vnew<CR>
nmap <silent> <leader>sl :rightbelow vnew<CR>
nmap <silent> <leader>sk :leftabove new<CR>
nmap <silent> <leader>sj :rightbelow new<CR>


" insert newline after and before enclosing braces
nmap <expr> <leader>(( getline(".")[col(".")-1] == "(" ? 'a<CR><esc>?(<CR>%i<CR><esc>' : ''

" Word count for latex
noremap <silent> <F3> :w !detex \| wc -w<CR>
" show open buffers with f5
noremap <silent> <F5> :buffers<CR>:buffer<Space>
" open term window
noremap <silent> <leader>tj :belowright new \| resize 15 \| set wfh \| term<CR> 
noremap <silent> <leader>twj :botright new \| resize 15 \| set wfh \| term<CR>
noremap <silent> <leader>twl :botright vnew \| vertical resize 80 \| set wfw \| term<CR>

<<<<<<< Updated upstream
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

||||||| constructed merge base
=======
" Search installed libraries for tags and add to envt.
>>>>>>> Stashed changes
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

" Switch black on and off.
let g:black_running = 0
function! Toggle_black_running()
    if g:black_running == 0
        let g:black_running = 1
        augroup BlackRunning
            autocmd!
            autocmd! BufWritePre *.py execute ':!Black -l 79 %'
        augroup END
		echo 'Black on'
    else
        let g:black_running = 0
        autocmd! BlackRunning
		echo 'Black off'
    endif
endfunction
nnoremap <leader>bl :call Toggle_black_running()<CR>

" Puts output of :read inline rather than on a new line.
fu! InlineRead(command)
  let colnum = col('.')
  let line = getline('.')
  call setline('.', strpart(line, 0, colnum) . system(a:command) . strpart(line, colnum))
endfu

command! -nargs=1 IRead call InlineRead(<f-args>)

<<<<<<< Updated upstream
nnoremap <C-h> <C-\\><C-n><C-w>h
nnoremap <C-l> <C-\\><C-n><C-w>l
nnoremap <C-j> <C-\\><C-n><C-w>j
nnoremap <C-k> <C-\\><C-n><C-w>k
||||||| constructed merge base
tnoremap <localleader>hh <C-\><C-N><C-w>h
tnoremap <localleader>jj <C-\><C-N><C-w>j
tnoremap <localleader>kk <C-\><C-N><C-w>k
tnoremap <localleader>ll <C-\><C-N><C-w>l
inoremap <localleader>hh <C-\><C-N><C-w>h
inoremap <localleader>jj <C-\><C-N><C-w>j
inoremap <localleader>kk <C-\><C-N><C-w>k
inoremap <localleader>ll <C-\><C-N><C-w>l
nnoremap <localleader>hh <C-w>h
nnoremap <localleader>jj <C-w>j
nnoremap <localleader>kk <C-w>k
nnoremap <localleader>ll <C-w>l
=======
" Switching windows
"" In terminal
tnoremap <localleader>hh <C-\><C-N><C-w>h
tnoremap <localleader>jj <C-\><C-N><C-w>j
tnoremap <localleader>kk <C-\><C-N><C-w>k
tnoremap <localleader>ll <C-\><C-N><C-w>l
"" In insert mode
inoremap <localleader>hh <C-]><C-w>h
inoremap <localleader>jj <C-]><C-w>j
inoremap <localleader>kk <C-]><C-w>k
inoremap <localleader>ll <C-]><C-w>l
""" In normal mode
nnoremap <localleader>hh <C-w>h
nnoremap <localleader>jj <C-w>j
nnoremap <localleader>kk <C-w>k
nnoremap <localleader>ll <C-w>l

" fzf mappings
nnoremap <C-p> <silent> :Files<CR>
inoremap <C-p> <silent> :Files<CR>
nnoremap <C-p> <C-f> <silent> :Ag<CR>
nnoremap <C-p> <C-b> <silent> :Buffers<CR>
nnoremap <C-p> <C-m> <silent> :Marks<CR>
nnoremap <C-m> <C-w> <silent> :Windows<CR>
nnoremap <C-p> <C-h> <silent> :History:<CR>
nnoremap <C-s> <C-s> <silent> :Snippets<CR>
nnoremap <C-p> <C-c> <silent>:Commits<CR>
nnoremap <C-p> <C-p> <silent> :BCommits<CR>
nnoremap <leader>ph :Helptags<CR>
nnoremap <C-f> :Tags<CR>
>>>>>>> Stashed changes
