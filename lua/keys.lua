-- Disable arrow keys
vim.api.nvim_set_keymap("n", "<Left>", ':echoe "Use h"<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", ':echoe "Use l"<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", ':echoe "Use k"<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", ':echoe "Use j"<CR>', { noremap = true })

-- Move vertically by visual line
-- (only if no count was given)
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { expr = true, noremap = true })
vim.api.nvim_set_keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { expr = true, noremap = true })

vim.cmd([[
augroup npm
  autocmd!
  autocmd FileType javascript nnoremap <buffer><leader>mm :!npm run build
  autocmd FileType javascript nnoremap <buffer><leader>mt :!npm run test
augroup END
]])

vim.cmd([[
augroup clang-format
  autocmd!
  autocmd FileType c,cpp,cs,javascript,objc,objcpp noremap <buffer><C-K> :py3file /usr/local/opt/llvm/share/clang/clang-format.py<cr>
  autocmd FileType c,cpp,cs,javascript,objc,objcpp inoremap <buffer><C-K> <c-o>:py3file /usr/local/opt/llvm/share/clang/clang-format.py<cr>
augroup END
]])

vim.cmd([[
augroup make
  autocmd!
  autocmd FileType c,cpp,objc,objcpp,cmake nnoremap <buffer><leader>mm :Make --build build
  autocmd FileType c,cpp,objc,objcpp,cmake nnoremap <buffer><leader>mt :Make --target test --build build
  autocmd FileType c,cpp,objc,objcpp,cmake nnoremap <buffer><leader>mi :Make --target install --build build
augroup END
]])
