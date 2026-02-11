vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true })
--vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep_args<cr>", { noremap = true })
vim.api.nvim_set_keymap(
    "v",
    "<leader>fg",
    '"zy<esc>:Telescope live_grep_raw default_text=<c-r>z<cr>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f*", ":Telescope grep_string<cr>", { noremap = true })

vim.keymap.set("n", "<leader>fk", function()
    require("telescope.builtin").keymaps()
end)

vim.keymap.set("n", "<leader>fn", function()
    -- require('telescope.builtin').lsp_document_symbols({ symbols = 'function' })
    require('telescope.builtin').lsp_document_symbols()
end)

vim.keymap.set("n", "<leader>fs", function()
    require('telescope.builtin').lsp_document_symbols()
end)


local config = function()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            file_ignore_patterns = { "^bin/main/", "^bin/test/", "%.class$", "node_modules/" },
            -- path_display = { "smart" },
            wrap_results = true,
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("notify")
end

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = config,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-live-grep-args.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },
}
