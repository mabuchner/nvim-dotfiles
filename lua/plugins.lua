return {
    -- Easy-access terminal
    {
        "akinsho/toggleterm.nvim",
        opts = {
            open_mapping = [[<c-\>]],
            direction = "float",
            float_opts = {
                border = "curved",
            },
        },
    },

    -- Theme
    {
        "arcticicestudio/nord-vim",
        init = function()
            require("plug-config/nord")
        end,
    },

    -- Startup screen
    {
        "mhinz/vim-startify",
        init = function()
            require("plug-config/startify")
        end,
    },

    -- Remember last file positions
    "farmergreg/vim-lastplace",

    -- Indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            fileType = { "c", "cpp", "cmake", "cs", "css", "html", "javascript", "json", "objc", "python", "xml" },
        },
    },

    -- Highlight trailing whitespace
    {
        "ntpeters/vim-better-whitespace",
        init = function()
            require("plug-config/vim-better-whitespace")
        end,
    },

    -- Automatic closing of quotes, parenthesis, brackets, etc.
    {
        "windwp/nvim-autopairs",
        config = true,
    },

    -- Git
    "tpope/vim-fugitive",

    -- Modifications of surroundings
    "tpope/vim-surround",

    -- Allow plugins to repeat last action with .
    "tpope/vim-repeat",

    -- Asynchronous Make
    "tpope/vim-dispatch",

    -- Mappings for complimentary pairs
    "tpope/vim-unimpaired",

    -- Pig syntax highlighting
    "motus/pig.vim",

    -- Status line component showing the current code context using LSP
    {
        "SmiteshP/nvim-navic",
        config = true,
    },

    -- LSP
    "williamboman/mason-lspconfig.nvim",
    {
        "williamboman/mason.nvim",
        init = function()
            require("plug-config/mason-nvim")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            require("plug-config/lspconfig")
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    {
        "hrsh7th/nvim-cmp",
        init = function()
            require("plug-config/cmp")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        init = function()
            require("plug-config/luasnip")
        end,
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "jayp0521/mason-null-ls.nvim",
    {
        "jose-elias-alvarez/null-ls.nvim",
        init = function()
            require("plug-config/null-ls")
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded",
            },
        },
    },
    "nvim-lua/plenary.nvim", -- Required by null-ls and telescope
    "onsails/lspkind-nvim", -- Add pictograms to lsp completion

    -- Java LSP
    {
        "mfussenegger/nvim-jdtls",
        init = function()
            require("plug-config/nvim-jdtls")
        end,
    },

    -- Scala LSP
    {
        "scalameta/nvim-metals",
        init = function()
            require("plug-config/nvim-metals")
        end,
    }, -- Requires "nvim-lua/plenary.nvim

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        init = function()
            require("plug-config/nvim-dap")
        end,
    },

    -- Telescope
    -- Plug("nvim-lua/plenary.nvim")
    "nvim-telescope/telescope-live-grep-args.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope.nvim",
        init = function()
            require("plug-config/telescope")
        end,
    },

    -- lualine
    "kyazdani42/nvim-web-devicons",
    {
        "nvim-lualine/lualine.nvim",
        init = function()
            require("plug-config/lualine")
        end,
    },

    -- tressitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        init = function()
            require("plug-config/nvim-treesitter")
        end,
    },

    -- Notifications
    {
        "rcarriga/nvim-notify",
        init = function()
            require("plug-config/nvim-notify")
        end,
    },

    -- Show LSP progress
    {
        "j-hui/fidget.nvim",
        config = true,
    },

    -- UI for vim.ui.select and vim.ui.input hooks
    "stevearc/dressing.nvim",

    -- Show light bulb in sign column whenever a code action is available
    {
        "kosayoda/nvim-lightbulb",
        opts = { autocmd = { enabled = true } },
    },
    "antoinemadec/FixCursorHold.nvim", -- Fix CursorHold behaviour see https://github.com/neovim/neovim/issues/12587

    -- List for diagnostics
    {
        "folke/trouble.nvim",
        init = function()
            require("plug-config/trouble")
        end,
    }, -- Depends on "kyazdani42/nvim-web-devicons"

    -- Comments
    {
        "numToStr/Comment.nvim",
        config = true,
    },

    -- Latex
    {
        "lervag/vimtex",
        init = function()
            require("plug-config/vimtex")
        end,
    },
}
