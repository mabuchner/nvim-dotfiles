vim.diagnostic.config({ virtual_text = true })

local config = function()
	-- Show line diagnostics automatically in hover window
	vim.o.updatetime = 250
	-- For diagnostics at specific cursor position
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])

	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	local navic = require("nvim-navic")
	local lsp_buf_set_keymaps = require("plug-config/lsp-buf-set-keymaps")

	-- Use LspAttach autocmd (recommended pattern for Neovim 0.11+)
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			local bufnr = event.buf

			if client and client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end

			lsp_buf_set_keymaps(bufnr)
		end,
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- Set default capabilities for all LSP servers
	vim.lsp.config("*", {
		capabilities = capabilities,
	})

	-- Borders for floating windows
	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end

	mason.setup()
	mason_lspconfig.setup()
end

return {
	{
		"j-hui/fidget.nvim",
		version = "*", -- alternatively, pin this to a specific version, e.g., "1.6.1"
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = config,
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",

			-- Loading indicator
			{
				"j-hui/fidget.nvim",
				opts = {},
			},

			-- Component to get code
			"SmiteshP/nvim-navic",
			"hrsh7th/cmp-nvim-lsp",
		},
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
