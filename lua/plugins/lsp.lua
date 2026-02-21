vim.diagnostic.config({ virtual_text = true })

local config = function()
	-- Full diagnostic detail on demand via <space>e (vim.diagnostic.open_float)
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
		},
	})

	-- Diagnostic keymaps (global)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true, silent = true })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true, silent = true })

	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local navic = require("nvim-navic")

	-- Use LspAttach autocmd (recommended pattern for Neovim 0.11+)
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			local bufnr = event.buf

			if client and client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end

			-- Enable completion triggered by <c-x><c-o>
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

			local buf = { buffer = bufnr, noremap = true, silent = true }

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buf)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, buf)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buf)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, buf)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, buf)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, buf)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, buf)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, buf)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, buf)
			vim.keymap.set({ "v", "n" }, "<space>ca", vim.lsp.buf.code_action, buf)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, buf)
			vim.keymap.set({ "v", "n" }, "<space>f", function()
				vim.lsp.buf.format({
					async = true,
					filter = function(c)
						return c.name ~= "gopls" -- Use gofmt / gofumpt for formatting
					end,
				})
			end, buf)
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

			-- Component to get code context in winbar
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
