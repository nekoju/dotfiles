require "paq" {
    "andymass/vim-matchup";
    "chrisbra/csv.vim";
    "dag/vim-fish";
    "drewtempelmeyer/palenight.vim";
    "elzr/vim-json";
    "fs111/pydoc.vim";
    "jeffkreeftmeijer/vim-numbertoggle";
    "jpalardy/vim-slime";
    "junegunn/fzf";
    "junegunn/fzf.vim";
    "khaveesh/vim-fish-syntax";
    "Konfekt/FastFold";
    "lervag/vimtex";
    "mpjuers/showcontext";
    'nathanaelkane/vim-indent-guides';
    "neovim/nvim-lspconfig";
    "tmhedberg/SimpylFold";
    "savq/paq-nvim";      "tpope/vim-commentary";
    "tpope/vim-fugitive";
    "tpope/vim-surround";
    "Vimjas/vim-python-pep8-indent";
    "vim-pandoc/vim-pandoc-syntax";
    "wesQ3/vim-windowswap";
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

local maps = {
    {"i", "((", "()<left>", {noremap=true}},
    {"i", "[[", "[]<left>", {noremap=true}},
    {"i", "{{", "{}<left>", {noremap=true}},
    {"i", "<<", "<><left>", {noremap=true}},
    {"i", "(((", "(<CR>)<ESC>O<tab>", {noremap=true}},
    {"i", "[[[", "[<CR>]<ESC>O<tab>", {noremap=true}},
    {"i", "{{{", "{<CR>}<ESC>O<tab>", {noremap=true}},
    {"i", "<silent><expr> <Esc>", 'pumvisible() ? "\\<C-e><Esc>" : "\\<Esc>"', {noremap = true}},
    {"i", "<silent><expr> <C-c>", 'pumvisible() ? "\\<C-e><C-c>" : "\\<C-c>"', {noremap = true}},
    {"i", "<silent><expr> <BS>", 'pumvisible() ? "\\<C-e><BS>"  : "\\<BS>"', {noremap = true}},
    {"i", "<silent><expr> <C-l>", 'pumvisible() ? (complete_info().selected == -1 ? "\\<C-e><CR>" : "\\<C-y>") : "\\<C-l>"', {noremap = true}},
    {"i", "<silent><expr> <Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap = true}},
    {"i", "<silent><expr> <S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<BS>"', {noremap = true}},
    {"n", "<C-w><C-j>", ":SlimeConfig<CR> b:terminal_job_id<CR>", {noremap = true}},
    {"x", "<Space>", "<Plug>SlimeRegionSend }j", {noremap = true}},
    {"n", "<Space>", "<Plug>SlimeParagraphSend }j", {noremap = true}},
    {"x", "<Space>", "<Plug>SlimeRegionSend }j", {noremap = true}},
    {"n", "<Space>", "<Plug>SlimeParagraphSend }j", {noremap = true}},
    {"", "<F4>", ":set hlsearch! hlsearch?<CR>", {noremap = true}},
    {"", "<C-n>", ":set relativenumber!<cr>", {noremap = true, silent = true}},
    {"n", "j", "gj", {noremap = true}},
    {"n", "k", "gk", {noremap = true}},
    {"n", "gj", "j", {noremap = true}},
    {"n", "gk", "k", {noremap = true}},
    {"", "<leader>swh", ":topleft vnew<CR>", {noremap = true, silent = true}},
    {"", "<leader>swl", ":botright vnew<CR>", {noremap = true, silent = true}},
    {"", "<leader>swk", ":topleft new<CR>", {noremap = true, silent = true}},
    {"", "<leader>swj", ":botright new<CR>", {noremap = true, silent = true}},
    {"", "<leader>sh", ":leftabove vnew<CR>", {noremap = true, silent = true}},
    {"", "<leader>sl", ":rightbelow vnew<CR>", {noremap = true,  silent = true}},
    {"", "<leader>sk", ":leftabove new<CR>", {noremap = true,  silent = true}},
    {"", "<leader>sj", ":rightbelow new<CR>", {noremap = true,  silent = true}},
    {"", "<F3>", ":w !detex | wc -w<CR>", {noremap = true,  silent = true}},
    {"", "<F5>", ":buffers<CR>:buffer<Space>", {noremap = true,  silent = true}},
    {"", "<leader>tj", ":belowright new | resize 15 | set wfh | term<CR>", {noremap = true,  silent = true}},
    {"", "<leader>twj", ":botright new | resize 15 | set wfh | term<CR>", {noremap = true,  silent = true}},
    {"", "<leader>twl", ":botright vnew | vertical resize 100 | set wfw | term<CR>", {noremap = true,  silent = true}},
    {"n", "<leader>lc", ":call ShowContext_toggle()<CR>", {noremap = true}},
    {"n", "<leader>bl", ":! black -l 79 % > /dev/null<CR>", {noremap = true}},
    {"t", "<leader>hh", "<C-\\><C-N><C-w>h", {noremap = true}},
    {"t", "<leader>jj", "<C-\\><C-N><C-w>j", {noremap = true}},
    {"t", "<leader>kk", "<C-\\><C-N><C-w>k", {noremap = true}},
    {"t", "<leader>ll", "<C-\\><C-N><C-w>l", {noremap = true}},
    {"i", "<leader>hh", "<C-]><C-w>h", {noremap = true}},
    {"i", "<leader>jj", "<C-]><C-w>j", {noremap = true}},
    {"i", "<leader>kk", "<C-]><C-w>k", {noremap = true}},
    {"i", "<leader>ll", "<C-]><C-w>l", {noremap = true}},
    {"n", "<leader>hh", "<C-w>h", {noremap = true}},
    {"n", "<leader>jj", "<C-w>j", {noremap = true}},
    {"n", "<leader>kk", "<C-w>k", {noremap = true}},
    {"n", "<leader>ll", "<C-w>l", {noremap = true}}
}
for i, map in ipairs(maps) do vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4]) end

-- status bar colors
local o = vim.o
local activestatus = "%#DiffAdd#"
local inactivestatus = "%#StatusLine# %n %#WildMenu# %<%F%m%r%h%w "
local venv = vim.api.nvim_eval([[
    substitute(system("bash -c 'venv=${VIRTUAL_ENV%/*} \\
    && echo ${venv##*/}'"), "\n", "", "g")
]])
local gitdir = vim.api.nvim_eval([[system("bash -c 'git rev-parse --show-toplevel'")]])
local path = vim.api.nvim_eval([[expand('%:p')]])
local statusline = ""
statusline = statusline .. activestatus .. " %n "                               	-- Buffer number
statusline = statusline .. activestatus .. " %{toupper(g:currentmode[mode()])} "  	-- The current mode
statusline = statusline .. "%#WildMenu# %<%{expand('%:~:.')}%m%r%h%w "                       	-- File path, modified, readonly, helpfile, preview
statusline = statusline .. "%#StatusLineNC# %Y "                                 	-- FileType
statusline = statusline .. activestatus .. " %{FugitiveHead()} | "statusline = statusline .. activestatus .. venv
statusline = statusline .. " | %#WildMenu#"
o.statusline = statusline
-- autocommand

local vimrc = vim.api.nvim_create_augroup('vimrc', {clear = true})
local snakemake = vim.api.nvim_create_augroup("snakemake", {clear = true})
local status = vim.api.nvim_create_augroup("status", {clear = true})
local autocmds = {
    {"WinEnter", {pattern = "*", group = status, callback = function () vim.wo.statusline = statusline end}},
    {"WinLeave", {pattern = "*", group = status, callback = function () vim.wo.statusline = inactivestatus end}},
    {"FileType", { pattern = "make", group = vimrc, command = "setlocal noexpandtab"}},
    {"FileType", { pattern = "rmd", group = vimrc, command = "setlocal commentstring=#%s"}},
    {"FileType", { pattern = "cpp", group = vimrc, command = "setlocal commentstring=//%s"}},
    {"FileType", { pattern = "tex", group = vimrc, command = "setlocal spell spelllang=en_us"}},
    {"BufEnter", { pattern = "term://*", group = vimrc, command = "wincmd + | wincmd - | wincmd < | wincmd >"}},
    {"FileType", { pattern = "crontab", group = vimrc, command = "setlocal nobackup nowritebackup"}},
    {{"BufNewFile", "BufRead"}, { pattern = "Snakefile", group = snakemake, command = "set syntax=snakemake"}},
    {{"BufNewFile", "BufRead"}, { pattern = "*.snake", group = snakemake, command = "set syntax=snakemake"}},
    {"WinLeave", { pattern = "term://.*", group = marks, command = "mT"}},
}
for i, cmd in ipairs(autocmds) do vim.api.nvim_create_autocmd(cmd[1], cmd[2]) end

local set = vim.opt

-- colors
set.background = "dark"
vim.cmd("colorscheme palenight")

--settings
vim.cmd([[
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
]])

vim.g.coq_settings = {auto_start = "shut-up", keymap = {eval_snips = "<leader>ss"}}
vim.g.slime_target = "neovim"
vim.g.slime_python_ipython = 1
-- vim.call("let $VIMHOME = expand('<sfile>:p:h')")
vim.g.black_running = 0
vim.g['pandoc#keyboard#use_default_mappings'] = 0
vim.g.fzf_layout = {down = '40%'}
vim.g.r_syntax_folding = 1
vim.g.tex_fold_enabled = 1
vim.g.sh_fold_enabled = 5
vim.g.loaded_matchit = 1
vim.g.neoterm_autoscroll = 1
vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_guide_size = 1

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



vim.api.nvim_create_augroup("marks", {clear = True})

-- local tags = vim.api.nvim_create_augroup("tags", {clear = true})
-- vim.api.nvim_create_autocmd("VimEnter",{
--     pattern = "*",--     group = tags,
--     command = "call SetTags(trim(system('git rev-parse --show-toplevel')) . '/.tags')"
-- })
-- vim.api.nvim_create_autocmd("DirChanged", {
--     pattern = "*",
--     group = tags,
--     command = "call SetTags(trim(system('git rev-parse --show-toplevel')) . '/.tags')"
-- })

-- lsp

local lsp = require "lspconfig"
local coq = require "coq"
lsp.pyright.setup(coq.lsp_ensure_capabilities())
