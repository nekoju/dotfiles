<<<<<<< Updated upstream
" CtrlP-funky
nnoremap <C-f> :CtrlPFunky<Cr>
" Ctrl-] uses ctags if available, otherwise CtrlP-Funky
function! GoTo()
    try
        execute "ma T"
        execute "tag " . expand("<cword>")
    catch
        execute "CtrlPFunky " . expand("<cword>")
    endtry
endfunction

let g:ctrlp_funky_after_jump = 'zvzz'
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_funky_multi_buffers = 1
nnoremap <C-]> :call GoTo()<CR>

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
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_by_filename = 1
noremap <leader>bu :CtrlPBuffer<CR>

"" Ultisnips setup
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger='<Tab>'
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" let g:UltiSnipsSnippetsDir="~/.config/nvim/ultisnips/snippets"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="horizontal"
" let g:UltiSnipsEnableSnipMate=1
""end ultisnips stuff


"" submode
"" A message will appear in the message line when you're in a submode
"" " and stay there until the mode has existed.
"let g:submode_always_show_submode = 1
""
"" " We're taking over the default <C-w> setting. Don't worry we'll do
"" " our best to put back the default functionality.
"call submode#enter_with('window', 'n', '', '<C-w>')
"call submode#enter_with('scroll', 'n', '', 's')
""
"" Note: <C-c> will also get you out to the mode without this mapping.
"" Note: <C-[> also behaves as <ESC>
"call submode#leave_with('window', 'n', '', '<ESC>')
"call submode#leave_with('scroll', 'n', '', '<ESC>')
""
"" Go through every letter
"for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
"            \'n','o','p','q','r','s','t','u','v','w','x','y','z']
"    " maps lowercase, uppercase and <C-key>
"    call submode#map('window', 'n', '', key, '<C-w>' . key)
"    call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
"    call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
"endfor

"" scroll bindings, make hjkl scroll half window
"call submode#map('scroll', 'n', '', 'h', 'zH')
"call submode#map('scroll', 'n', '', 'l', 'zL')
"call submode#map('scroll', 'n', '', 'j', '<C-d>')
"call submode#map('scroll', 'n', '', 'k', '<C-u>')

"" Go through symbols. Sadly, '|', not supported in submode plugin.
"for key in ['=','_','+','-','<','>']
"    call submode#map('window', 'n', '', key, '<C-w>' . key)
"endfor
""
"" Old way, just in case.
"nnoremap <Leader>w <C-w>


||||||| constructed merge base
" CtrlP-funky
nnoremap <C-f> :CtrlPFunky<Cr>
" Ctrl-] uses ctags if available, otherwise CtrlP-Funky
function! GoTo()
    try
        execute "ma T"
        execute "tag " . expand("<cword>")
    catch
        execute "CtrlPFunky " . expand("<cword>")
    endtry
endfunction

let g:ctrlp_funky_after_jump = 'zvzz'
let g:ctrlp_funky_use_cache = 1
let g:ctrlp_funky_multi_buffers = 1
nnoremap <C-]> :call GoTo()<CR>

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
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_by_filename = 1
noremap <leader>bu :CtrlPBuffer<CR>

=======
>>>>>>> Stashed changes
" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'Build'
            \}
let g:vimtex_index_show_help = 0
let g:vimtex_toc_fold = 1

" for Skim
let g:vimtex_view_general_viewer
            \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
    if !a:status | return | endif
    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
        call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction

" nvim-r options
let R_tmpdir = "/tmp/R_tmp"
let R_rconsole_width = 0

" syntastic
" if &diff == 0
"     set statusline+=%#warningmsg#
"     set statusline+=%{SyntasticStatuslineFlag()}
"     set statusline+=%*

"     let g:syntastic_always_populate_loc_list = 1
"     let g:syntastic_auto_loc_list = 1
"     let g:syntastic_check_on_open = 1
"     let g:syntastic_check_on_wq = 0
" endif

" ale
let g:ale_open_list = 0
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fixers = {'python': ['autopep8']} 
" close locallist on buffer exit
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END


" deoplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('auto_complete', 1)
" autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" augroup omnifuncs
"     autocmd!
"     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" augroup end
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#enable_smart_case = 1

" jedi-vim
let g:jedi#completions_enabled = 0

" vim-python-pep8-indent
let python_pep8_indent_hang_closing = 0

" neosnippet
let g:neosnippet#enable_completed_snippet = 1
autocmd CompleteDone * call neosnippet#complete_done()
imap <c-j>  <Plug>(neosnippet_expand_or_jump)
smap <c-j>  <Plug>(neosnippet_expand_or_jump)
xmap <c-j>  <Plug>(neosnippet_expand_target)
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" vimtex
let g:vimtex_compiler_progname = 'nvr'


" nvim-r
let R_latexmk = 0
let R_latexcmd=['latexmk',  '-pdf', '-pdflatex="pdflatex -file-line-error - synctex=1"', '-jobname=./build/% -pdf']
let R_console_height = 15
let R_objbr_w = 30
let vimrplugin_rnowebchunk = 0
let R_esc_term = 0
let R_nvimpager = "horizontal"
" set skim to pdf viewer
let r_pdfviewer = "skim"
let r_show_args = 1
let r_openpdf = 1
let r_openhtml = 1
let r_indent_align_args = 0
let r_indent_ess_compatible = 0
let r_indent_ess_comment = 0
" nvim-R bindings
nmap <LocalLeader>md <Plug>RMakeRmd  

" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" nmap <localleader>kr <Plug>RMakeRmd
" send line to R with space bar
nmap <Space> <Plug>RDSendLine


" AutoPairs
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

" Voom
" word count
noremap <leader>vl :Voom latex <CR>

" Airline
let g:airline_theme='solarized'
let g:airline#extensions#ale#enabled = 1

" Fugitive
" Prevent opening of new tab with :Git command.
let g:fugitive_force_bang_command = 1

" IndentLine
let g:indentLine_enabled = 0

" lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
