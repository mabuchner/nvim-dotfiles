vim.cmd("nmap <leader>/ <Plug>RgRawSearch")
vim.cmd("vmap <leader>/ <Plug>RgRawVisualSelection")
vim.cmd("nmap <leader>* <Plug>RgRawWordUnderCursor")

vim.g["agriculture#rg_options"] = "--smart-case"

