require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.keymap.del("n", "<Tab>")
vim.keymap.del("n", "<S-Tab>")

local maps = {
    -- {"i", "((", "()<left>", {noremap=true}},
    -- {"i", "[[", "[]<left>", {noremap=true}},
    -- {"i", "{{", "{}<left>", {noremap=true}},
    -- {"i", "<<", "<><left>", {noremap=true}},
    -- {"i", "(((", "(<CR>)<ESC>O<tab>", {noremap=true}},
    -- {"i", "[[[", "[<CR>]<ESC>O<tab>", {noremap=true}},
    -- {"i", "{{{", "{<CR>}<ESC>O<tab>", {noremap=true}},
    {"i", "<silent><expr> <Esc>", 'pumvisible() ? "\\<C-e><Esc>" : "\\<Esc>"', {noremap = true}},
    {"i", "<silent><expr> <C-c>", 'pumvisible() ? "\\<C-e><C-c>" : "\\<C-c>"', {noremap = true}},
    {"i", "<silent><expr> <BS>", 'pumvisible() ? "\\<C-e><BS>"  : "\\<BS>"', {noremap = true}},
    {"i", "<silent><expr> <C-l>", 'pumvisible() ? (complete_info().selected == -1 ? "\\<C-e><CR>" : "\\<C-y>") : "\\<C-l>"', {noremap = true}},
    {"i", "<silent><expr> <Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap = true}},
    {"n", "<leader>]]", ":bnext<CR>", {noremap=true}},
    {"n", "<leader>[[", ":bprevious<CR>", {noremap=true}},
    {"i", "<silent><expr> <S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<BS>"', {noremap = true}},
    -- {"n", "<C-w><C-j>", ":SlimeConfig<CR> b:terminal_job_id<CR>", {noremap = true}},
    -- {"x", "<Space>", "<Plug>SlimeRegionSend }j", {noremap = true}},
    -- {"n", "<Space>", "<Plug>SlimeParagraphSend }j", {noremap = true}},
    -- {"x", "<Space>", "<Plug>SlimeRegionSend }j", {noremap = true}},
    -- {"n", "<Space>", "<Plug>SlimeParagraphSend }j", {noremap = true}},
    {"", "<F4>", ":set hlsearch! hlsearch?<CR>", {noremap = true}},
    {"n", "<leader>nn", "* <Cmd>NvimTreeToggle<CR>", {noremap = true, silent = true}},
    -- {"", "<C-n>", ":set relativenumber!<cr>", {noremap = true, silent = true}},
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
    {"n", "<leader>ll", "<C-w>l", {noremap = true}},
    {"n", "<leader>l0", ":lua for _, b in ipairs(vim.api.nvim_list_bufs()) do vim.diagnostic.disable(b) end<CR>", {noremap = true}},
    {"n", "<leader>l1", ":lua for _, b in ipairs(vim.api.nvim_list_bufs()) do vim.diagnostic.enable(b) end<CR>", {noremap = true}},
    {"n", "<C-w>z", ":MaximizerToggle<CR>", {noremap = true}},
    -- {"n", "<leader>l0", ":lua vim.diagnostic.disable(0)<CR>", {noremap = true}},
    -- {"n", "<leader>l1", ":lua vim.diagnostic.enable(0)<CR>", {noremap = true}},
}
for i, map in ipairs(maps) do vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4]) end

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
