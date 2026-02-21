return {
    "voldikss/vim-translator",
    keys = "<leader>t",
    config = function()
        vim.g.translator_target_lang = "en"
        vim.g.translator_default_engines = { "google" }
        vim.g.translator_window_max_width = 0.8
        vim.g.translator_window_max_height = 0.8
        vim.keymap.set("n", "<leader>t", "<Plug>TranslateW<cr>",  { noremap = true })
        vim.keymap.set("v", "<leader>t", "<Plug>TranslateWV<cr>", { noremap = true })
    end,
}
