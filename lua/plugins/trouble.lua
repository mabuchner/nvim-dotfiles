-- List for diagnostics

local init = function()
    require("trouble").setup({
        auto_preview = false, -- Do not directly jump to location of diagnostics
    })

    vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap(
        "n",
        "<leader>xw",
        "<cmd>Trouble workspace_diagnostics<cr>",
        { silent = true, noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "<leader>xd",
        "<cmd>Trouble document_diagnostics<cr>",
        { silent = true, noremap = true }
    )
    vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
end

return {
    {
        "folke/trouble.nvim",
        init = init,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
}
