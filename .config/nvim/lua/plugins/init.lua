return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim"  }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master"  }, -- for curl, log and async functions

        },
        build = "make tiktoken", -- Only on MacOS or Linux
        event = "VeryLazy",
        opts = {
            -- See Configuration section for options
            --     
            -- See Commands section for default commands if you want to lazy load on them
            --   
        },
        config = function ()
            require('CopilotChat').setup({})
        end,
    },
    {
        'szw/vim-maximizer',
        event = 'VeryLazy',

    },
    {
        "github/copilot.vim",
        event = "VeryLazy",
    },
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    -- lightspeed.nvim
    {
        'ggandor/leap.nvim',
        event = 'VeryLazy',
        config = function ()
            require('leap').set_default_mappings()
        end,
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        version = "å*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "basedpyright",
                "perlnavigator",
            },
        },
    },
    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "python",
            },
        },
    },
    {
        "wesQ3/vim-windowswap",
        event = "VeryLazy"
    }
}
