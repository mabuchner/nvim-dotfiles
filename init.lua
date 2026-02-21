local g = vim.g
local opt = vim.opt

g.mapleader = ","

opt.undofile = true

-- Enable spell-checking
opt.spell = true
opt.spelllang = "en_gb"

-- Show line numbers
opt.number = true
opt.relativenumber = true
-- Increase the width of the number column
opt.numberwidth = 5

-- Always show error gutter column
opt.signcolumn = "yes"
-- Highlight current line
opt.cursorline = true
-- Color certain column
opt.colorcolumn = "80,100"
-- Show matching brackets
opt.showmatch = true
-- Always show tab bar
opt.showtabline = 2
-- When searching try to be smart about cases
opt.smartcase = true
-- Ignore case when searching
opt.ignorecase = true
-- Enable wildmenu
opt.wildmode = "longest:list,full"
-- Restrict number of elements in popup menu
opt.pumheight = 10
-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 3

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Enable mouse input
opt.mouse = "a"
opt.mousemodel = "popup"

-- Enable 24-bit RGB color (requires a compatible terminal)
opt.termguicolors = true

local filetype_group = vim.api.nvim_create_augroup("setFileSyntax", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = "*.mm",
  callback = function() vim.bo.filetype = "objcpp" end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = "*.vl",
  callback = function() vim.bo.filetype = "json" end,
})

local indent_group = vim.api.nvim_create_augroup("custom-shift-width", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "javascript", "json", "typescript", "typescriptreact" },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = "go",
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- Better formatting for git commit messages
-- vim.cmd([[
-- autocmd Filetype gitcommit setlocal spell colorcolumn=72 textwidth=72 formatoptions+=a
-- ]])

-- Better formatting for markdown files
-- vim.cmd([[
-- autocmd Filetype markdown setlocal spell wrap linebreak nolist complete+=kspell
-- ]])

-- Netrw
g.netrw_preview = 1 -- Preview files in a vertical split (press p to preview)
g.netrw_liststyle = 3 -- Tree style listing
g.netrw_winsize = 30 -- With a vertical split open, show the directory listing with only 30 columns
-- Show line numbers
g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

require("keys")

require("lsp")

require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"bibtex",
		"c",
		"c_sharp",
		"cmake",
		"commonlisp",
		"cpp",
		"css",
		"csv",
		"forth",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"glsl",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"gowork",
		"html",
		"idl",
		"java",
		"javadoc",
		"javascript",
		"jsdoc",
		"json",
		"jsx",
		"latex",
		"lua",
		"luadoc",
		"make",
		"markdown",
		"mermaid",
		"meson",
		"ninja",
		"odin",
		"proto",
		"python",
		"rust",
		"sql",
		"toml",
		"tsv",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"vue",
		"xml",
		"yaml",
		"zsh",
	},
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()
		-- folds, provided by Neovim
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo.foldmethod = "expr"
		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
