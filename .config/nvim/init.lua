require "paq" {
    "savq/paq-nvim";   
    "andymass/vim-matchup";
    "chrisbra/csv.vim";
    -- "dag/vim-fish";
    "drewtempelmeyer/palenight.vim";
    "elzr/vim-json";
    "fs111/pydoc.vim";
    "jeffkreeftmeijer/vim-numbertoggle";
    "jiangmiao/auto-pairs";
    "jpalardy/vim-slime";
    "khaveesh/vim-fish-syntax";
    "Konfekt/FastFold";
    "lervag/vimtex";
    "mpjuers/showcontext";
    "neovim/nvim-lspconfig";
    "nathanaelkane/vim-indent-guides";
    "tmhedberg/SimpylFold";
    "tpope/vim-commentary";
    "tpope/vim-fugitive";
    "tpope/vim-surround";
    "Vimjas/vim-python-pep8-indent";
    "vim-pandoc/vim-pandoc-syntax";
    "wesQ3/vim-windowswap";
    "w0rp/ale";
    -- main one
    {"ms-jpq/coq_nvim", branch="coq"};
    -- 9000+ Snippets
    {"ms-jpq/coq.artifacts", branch="artifacts"};
    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    {"ms-jpq/coq.thirdparty", branch="3p"};
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
}

vim.api.nvim_set_keymap(
"x",
"<Space>",
"<Plug>SlimeRegionSend",
{}
)
vim.api.nvim_set_keymap(
"n",
"<Space>",
"<Plug>SlimeParagraphSend",
{}
)
vim.api.nvim_set_keymap(
"x",
"<Space>",
"<Plug>SlimeRegionSend",
{}
)
vim.api.nvim_set_keymap(
"n",
"<Space>",
"<Plug>SlimeParagraphSend",
{}
)
vim.api.nvim_set_keymap(
"",
"<F4>",
":set hlsearch! hlsearch?<CR>",
{noremap = true}
)
vim.api.nvim_set_keymap(
"",
"<C-n>",
":set relativenumber!<cr>",
{noremap = true,
silent = true}
)
vim.api.nvim_set_keymap(
"n",
"j",
"gj",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"k",
"gk",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"gj",
"j",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"gk",
"k",
{noremap = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>swh",
":topleft vnew<CR>",
{noremap = true,
silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>swl",
":botright vnew<CR>",
{noremap = true,
silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>swk",
":topleft new<CR>",
{noremap = true,
silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>swj",
":botright new<CR>",
{noremap = true,
silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>sh",
":leftabove vnew<CR>",
{noremap = true,
silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>sl",
":rightbelow vnew<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>sk",
":leftabove new<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>sj",
":rightbelow new<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<F3>",
":w !detex | wc -w<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<F5>",
":buffers<CR>:buffer<Space>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>tj",
":belowright new | resize 15 | set wfh | term<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>twj",
":botright new | resize 15 | set wfh | term<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>twl",
":botright vnew | vertical resize 100 | set wfw | term<CR>",
{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
"n",
"<leader>lc",
":call ShowContext_toggle()<CR>",
{noremap = true}
)
vim.api.nvim_set_keymap(
"",
"<leader>bl",
":call Toggle_black_running()<CR>",
{}
)
vim.api.nvim_set_keymap(
"t",
"<leader>hh",
"<C-\\><C-N><C-w>h",
{noremap = true}
)
vim.api.nvim_set_keymap(
"t",
"<leader>jj",
"<C-\\><C-N><C-w>j",
{noremap = true}
)
vim.api.nvim_set_keymap(
"t",
"<leader>kk",
"<C-\\><C-N><C-w>k",
{noremap = true}
)
vim.api.nvim_set_keymap(
"t",
"<leader>ll",
"<C-\\><C-N><C-w>l",
{noremap = true}
)
vim.api.nvim_set_keymap(
"i",
"<leader>hh",
"<C-]><C-w>h",
{noremap = true}
)
vim.api.nvim_set_keymap(
"i",
"<leader>jj",
"<C-]><C-w>j",
{noremap = true}
)
vim.api.nvim_set_keymap(
"i",
"<leader>kk",
"<C-]><C-w>k",
{noremap = true}
)
vim.api.nvim_set_keymap(
"i",
"<leader>ll",
"<C-]><C-w>l",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"<leader>hh",
"<C-w>h",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"<leader>jj",
"<C-w>j",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"<leader>kk",
"<C-w>k",
{noremap = true}
)
vim.api.nvim_set_keymap(
"n",
"<leader>ll",
"<C-w>l",
{noremap = true}
)

local set = vim.opt

-- colors
set.background = "dark"
vim.cmd("colorscheme palenight")

--settings
vim.cmd(
[[
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
    ]]
    )

    vim.g.coq_settings = {auto_start = 'shut-up'}
    vim.g.slime_target = "neovim"
    vim.g.python3_host_prog = "/usr/local/Caskroom/miniconda/base/bin/python"
    -- vim.call("let $VIMHOME = expand('<sfile>:p:h')")
    vim.g.black_running = 0
    vim.g['pandoc#keyboard#use_default_mappings'] = 0
    vim.g.fzf_layout = {down = '40%'}
    vim.g.r_syntax_folding = 1
    vim.g.tex_fold_enabled = 1
    vim.g.sh_fold_enabled = 5
    vim.g.loaded_matchit = 1
    vim.g.neoterm_autoscroll = 1

    set.termguicolors = true
    -- set.background = "dark"
    set.autoread = true
    set.inccommand = "nosplit"
    set.expandtab = true
    set.shiftwidth = 4
    set.tabstop = 4
    set.foldmethod = "syntax"
    set.wildmode = "longest,list"
    set.wildmenu = false
    set.breakindent = true
    set.colorcolumn = "80"
    set.cursorline = true
    set.number = true
    set.linebreak = true
    set.ignorecase = true
    set.smartcase = true
    set.enc = "utf8"
    set.ruler = false
    set.sw = 4
    set.swapfile = false
    set.mouse = "a"
    set.ttimeoutlen = 10
    set.hlsearch = true
    set.completeopt = "longest,menuone"
    set.conceallevel = 0
    set.updatetime = 400
    -- set.shortmess += F
    set.laststatus = 2
    set.showmode = false
    vim.cmd("set formatoptions-=c formatoptions-=r formatoptions-=o")
    vim.cmd("set sessionoptions-=folds")

    -- status bar colors
    local o = vim.o 
    o.statusline = ""
    o.statusline = o.statusline .. "%#DiffAdd# %n "                               	-- Buffer number
    o.statusline = o.statusline .. "%#DiffAdd# %{toupper(g:currentmode[mode()])} "  	-- The current mode
    o.statusline = o.statusline .. "%#StatusLine# %<%F%m%r%h%w "                       	-- File path, modified, readonly, helpfile, preview
    o.statusline = o.statusline .. "%#StatusLineNC# %Y "                                 	-- FileType
    o.statusline = o.statusline .. "%#DiffAdd# %{FugitiveHead()} " 
    o.statusline = o.statusline .. "%#StatusLine#"
    
    -- local statuscolor = vim.api.nvim_create_augroup("statuscolor", {clear = true})
    -- vim.api.nvim_create_autocmd("InsertEnter", {
    --     pattern = "*",
    --     group = statuscolor,
    --     command = "hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta"
    -- })
    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --     pattern = "*",
    --     group = statuscolor,
    --     command = "hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=cyan"
    -- })
    -- vim.cmd("hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan")



    -- autocommands
    local vimrc = vim.api.nvim_create_augroup('vimrc', {clear = true})
    vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "make",
        group = vimrc,
        command = "setlocal noexpandtab"
    }
    )
    vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "rmd",
        group = vimrc,
        command = "setlocal commentstring=#%s"
    }
    )
    vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "cpp",
        group = vimrc,
        command = "setlocal commentstring=//%s"
    }
    )
    vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "tex",
        group = vimrc,
        command = "setlocal spell spelllang=en_us"
    }
    )
    vim.api.nvim_create_autocmd(
    "BufEnter", {
        pattern = "term://*",
        group = vimrc,
        command = "wincmd + | wincmd - | wincmd < | wincmd >"
    }
    )
    vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "crontab",
        group = vimrc,
        command = "setlocal nobackup nowritebackup"
    }
    )

    local snakemake = vim.api.nvim_create_augroup("snakemake", {clear = true})
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
        pattern = "Snakefile",
        group = snakemake,
        command = "set syntax=snakemake"
    })
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
        pattern = "*.snake",
        group = snakemake,
        command = "set syntax=snakemake"
    })

    -- local tags = vim.api.nvim_create_augroup("tags", {clear = true})
    -- vim.api.nvim_create_autocmd("VimEnter",{
    --     pattern = "*", 
    --     group = tags,
    --     command = "call SetTags(trim(system('git rev-parse --show-toplevel')) . '/.tags')"
    -- })
    -- vim.api.nvim_create_autocmd("DirChanged", {
    --     pattern = "*",
    --     group = tags,
    --     command = "call SetTags(trim(system('git rev-parse --show-toplevel')) . '/.tags')"
    -- })
