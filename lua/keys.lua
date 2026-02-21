-- Disable arrow keys
vim.keymap.set("n", "<Left>",  ':echoe "Use h"<CR>', { noremap = true })
vim.keymap.set("n", "<Right>", ':echoe "Use l"<CR>', { noremap = true })
vim.keymap.set("n", "<Up>",    ':echoe "Use k"<CR>', { noremap = true })
vim.keymap.set("n", "<Down>",  ':echoe "Use j"<CR>', { noremap = true })

-- Move vertically by visual line
-- (only if no count was given)
vim.keymap.set("n", "k", "(v:count == 0 ? 'gk' : 'k')", { expr = true, noremap = true })
vim.keymap.set("n", "j", "(v:count == 0 ? 'gj' : 'j')", { expr = true, noremap = true })

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("npm", { clear = true }),
    pattern = "javascript",
    callback = function()
        vim.keymap.set("n", "<leader>mm", ":!npm run build", { buffer = true, noremap = true })
        vim.keymap.set("n", "<leader>mt", ":!npm run test", { buffer = true, noremap = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("clang-format", { clear = true }),
    pattern = { "c", "cpp", "cs", "javascript", "objc", "objcpp" },
    callback = function()
        vim.keymap.set("n", "<C-K>", ":py3file /usr/local/opt/llvm/share/clang/clang-format.py<cr>", { buffer = true, noremap = true })
        vim.keymap.set("i", "<C-K>", "<c-o>:py3file /usr/local/opt/llvm/share/clang/clang-format.py<cr>", { buffer = true, noremap = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("make", { clear = true }),
    pattern = { "c", "cpp", "objc", "objcpp", "cmake" },
    callback = function()
        vim.keymap.set("n", "<leader>mm", ":Make --build build", { buffer = true, noremap = true })
        vim.keymap.set("n", "<leader>mt", ":Make --target test --build build", { buffer = true, noremap = true })
        vim.keymap.set("n", "<leader>mi", ":Make --target install --build build", { buffer = true, noremap = true })
    end,
})
