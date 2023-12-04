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

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Enable mouse input
opt.mouse = "a"
opt.mousemodel = "popup"

-- Enable 24-bit RGB color (requires a compatible terminal)
opt.termguicolors = true

vim.cmd([[
augroup setFileSyntax
  autocmd!
  autocmd BufNewFile,BufRead *.mm set filetype=objcpp
  autocmd BufNewFile,BufRead *.vl set filetype=json
augroup END
]])

vim.cmd([[
augroup custom-shift-width
  autocmd!
  autocmd FileType javascript,json,typescript,typescriptreact setlocal shiftwidth=2 tabstop=2
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END
]])

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

-- Install plugin manager and load plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
