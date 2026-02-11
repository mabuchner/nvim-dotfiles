local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local lsp_buf_set_keymaps = require("plug-config/lsp-buf-set-keymaps")

local on_attach = function(client, bufnr)
	lsp_buf_set_keymaps(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_flags = {
	debounce_text_changes = 150,
}

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
		})
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
})

mason.setup()
mason_lspconfig.setup()
