return {
	{
		"j-hui/fidget.nvim",
		version = "*", -- alternatively, pin this to a specific version, e.g., "1.6.1"
		opts = {},
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = "rounded",
			},
		},
	},
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	opts = {
	-- 		auto_attach = true,
	-- 	},
	-- },
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local navic = require("nvim-navic")
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
		dependencies = {
			"SmiteshP/nvim-navic",
		},
	},
}
