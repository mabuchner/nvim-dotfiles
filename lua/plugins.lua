local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.local/share/nvim/plugged")

-- Easy-access terminal
Plug("akinsho/toggleterm.nvim")

-- Theme
Plug("arcticicestudio/nord-vim")

-- Startup screen
Plug("mhinz/vim-startify")

-- Remember last file positions
Plug("farmergreg/vim-lastplace")

-- Indentation guides
Plug("lukas-reineke/indent-blankline.nvim")

-- Highlight trailing whitespace
Plug("ntpeters/vim-better-whitespace")

-- Automatic closing of quotes, parenthesis, brackets, etc.
Plug("Raimondi/delimitMate")

-- Git
Plug("tpope/vim-fugitive")

-- Modifications of surroundings
Plug("tpope/vim-surround")

-- Allow plugins to repeat last action with .
Plug("tpope/vim-repeat")

-- Asynchronous Make
Plug("tpope/vim-dispatch")

-- Mappings for complimentary pairs
Plug("tpope/vim-unimpaired")

-- LSP
Plug("neovim/nvim-lspconfig")
Plug("williamboman/nvim-lsp-installer")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-vsnip")
Plug("hrsh7th/vim-vsnip")
Plug("rafamadriz/friendly-snippets")
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("ray-x/lsp_signature.nvim")
Plug("nvim-lua/plenary.nvim") -- Required by null-ls and telescope
Plug("onsails/lspkind-nvim") -- Add pictograms to lsp completion

-- Telescope
-- Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-live-grep-raw.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })

-- lualine
Plug("nvim-lualine/lualine.nvim")
Plug("kyazdani42/nvim-web-devicons")

-- tressitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn["TSUpdate"] })
Plug("lewis6991/spellsitter.nvim")

-- Notifications
Plug("rcarriga/nvim-notify")

-- Show light bulb in sign column whenever a code action is available
Plug("kosayoda/nvim-lightbulb")

-- Comments
Plug("numToStr/Comment.nvim")

-- Latex
Plug("lervag/vimtex")

vim.call("plug#end")

-- Configuration

require("plug-config/cmp")
require("plug-config/comment")
require("plug-config/indent-blankline")
require("plug-config/lsp-installer")
require("plug-config/lspconfig")
require("plug-config/lsp_signature")
require("plug-config/lualine")
require("plug-config/nord")
require("plug-config/null-ls")
require("plug-config/nvim-notify")
require("plug-config/nvim-lightbulb")
require("plug-config/nvim-treesitter")
require("plug-config/spellsitter")
require("plug-config/startify")
require("plug-config/telescope")
require("plug-config/toggleterm")
require("plug-config/vim-better-whitespace")
require("plug-config/vimtex")
