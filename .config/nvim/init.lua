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

vim.api.nvim_set_keymap("x", "<Space>", "<Plug>SlimeRegionSend", {})
vim.api.nvim_set_keymap("n", "<Space>", "<Plug>SlimeParagraphSend", {})
vim.api.nvim_set_keymap("x", "<Space>", "<Plug>SlimeRegionSend", {})
vim.api.nvim_set_keymap("n", "<Space>", "<Plug>SlimeParagraphSend", {})
vim.api.nvim_set_keymap("", "<F4>", ":set hlsearch! hlsearch?<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<C-n>", ":set relativenumber!<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "gj", {noremap = true})
vim.api.nvim_set_keymap("n", "k", "gk", {noremap = true})
vim.api.nvim_set_keymap("n", "gj", "j", {noremap = true})
vim.api.nvim_set_keymap("n", "gk", "k", {noremap = true})
vim.api.nvim_set_keymap("", "<leader>swh", ":topleft vnew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>swl", ":botright vnew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>swk", ":topleft new<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>swj", ":botright new<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>sh", ":leftabove vnew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>sl", ":rightbelow vnew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>sk", ":leftabove new<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>sj", ":rightbelow new<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<F3>", ":w !detex \\| wc -w<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<F5>", ":buffers<CR>:buffer<Space>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>tj", ":belowright new \\| resize 15 \\| set wfh \\| term<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>twj", ":botright new \\| resize 15 \\| set wfh \\| term<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>twl", ":botright vnew \\| vertical resize 100 \\| set wfw \\| term<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>lc", ":call ShowContext_toggle()<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<leader>bl", ":call Toggle_black_running()<CR>", {})
vim.api.nvim_set_keymap("t", "<leader>hh", "<C-\\><C-N><C-w>h", {noremap = true})
vim.api.nvim_set_keymap("t", "<leader>jj", "<C-\\><C-N><C-w>j", {noremap = true})
vim.api.nvim_set_keymap("t", "<leader>kk", "<C-\\><C-N><C-w>k", {noremap = true})
vim.api.nvim_set_keymap("t", "<leader>ll", "<C-\\><C-N><C-w>l", {noremap = true})
vim.api.nvim_set_keymap("i", "<leader>hh", "<C-]><C-w>h", {noremap = true})
vim.api.nvim_set_keymap("i", "<leader>jj", "<C-]><C-w>j", {noremap = true})
vim.api.nvim_set_keymap("i", "<leader>kk", "<C-]><C-w>k", {noremap = true})
vim.api.nvim_set_keymap("i", "<leader>ll", "<C-]><C-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>hh", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>jj", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>kk", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ll", "<C-w>l", {noremap = true})
