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
