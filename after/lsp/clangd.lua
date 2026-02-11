-- Specify offset encoding for clangd to avoid conflicts with null-ls
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities_clangd = cmp_nvim_lsp.default_capabilities()
capabilities_clangd.offsetEncoding = "utf-8"

return {
	capabilities = capabilities_clangd,
}
