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
	{
		"SmiteshP/nvim-navic",
		opts = {
			auto_attach = true,
		},
	},
}
