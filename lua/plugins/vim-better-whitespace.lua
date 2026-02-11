-- Highlight trailing whitespace
return {
    "ntpeters/vim-better-whitespace",
    init = function()
        -- Remove gitcommit and markdown from the blacklist
        vim.g.better_whitespace_filetypes_blacklist = { "diff", "unite", "help" }
        vim.g.show_spaces_that_precede_tabs = 1

        -- Workaround to hide trailing whitespace in the terminal
        -- (https://github.com/ntpeters/vim-better-whitespace/issues/158)
        local betterWhitespaceGrp = vim.api.nvim_create_augroup("BetterWhiteSpaceGrp", { clear = true })
        vim.api.nvim_create_autocmd("TermOpen", {
            command = "DisableWhitespace",
            group = betterWhitespaceGrp,
        })
    end,
}
