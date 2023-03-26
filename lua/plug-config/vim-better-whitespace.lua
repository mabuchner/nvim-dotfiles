local g = vim.g

-- Remove gitcommit and markdown from the blacklist
g.better_whitespace_filetypes_blacklist = { "diff", "unite", "help" }
g.show_spaces_that_precede_tabs = 1

-- Workaround to hide trailing whitespace in the terminal
-- (https://github.com/ntpeters/vim-better-whitespace/issues/158)
local betterWhitespaceGrp = vim.api.nvim_create_augroup("BetterWhiteSpaceGrp", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    command = "DisableWhitespace",
    group = betterWhitespaceGrp,
})
