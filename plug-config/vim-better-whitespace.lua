local g = vim.g

-- Remove gitcommit and markdown from the blacklist
g.better_whitespace_filetypes_blacklist = { "diff", "unite", "help" }
g.show_spaces_that_precede_tabs = 1
