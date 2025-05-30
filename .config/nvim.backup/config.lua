local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

require'lspconfig'.pyright.setup{python.venvPath = ~/.pyenv}
vim.g.TERM = "tmux-256color"

