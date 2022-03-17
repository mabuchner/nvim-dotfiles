local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.local/share/nvim/plugged")

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
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("nvim-lua/plenary.nvim") -- Required by null-ls

-- lualine
Plug("nvim-lualine/lualine.nvim")
Plug("kyazdani42/nvim-web-devicons")

-- fzf
Plug("junegunn/fzf", { ["do"] = vim.fn["fzf#install"] })
Plug("junegunn/fzf.vim")
Plug("jesseleite/vim-agriculture")

-- tressitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn["TSUpdate"] })
Plug("lewis6991/spellsitter.nvim")

-- Comments
Plug("numToStr/Comment.nvim")

-- Latex
Plug("lervag/vimtex")

vim.call("plug#end")

-- Configuration

require("plug-config/cmp")
require("plug-config/comment")
require("plug-config/fzf")
require("plug-config/indent-blankline")
require("plug-config/lsp-installer")
require("plug-config/lspconfig")
require("plug-config/lualine")
require("plug-config/nord")
require("plug-config/null-ls")
require("plug-config/nvim-treesitter")
require("plug-config/spellsitter")
require("plug-config/startify")
require("plug-config/vim-agriculture")
require("plug-config/vim-better-whitespace")
require("plug-config/vimtex")
