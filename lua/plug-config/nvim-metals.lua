-- Based on https://github.com/scalameta/nvim-metals/discussions/39

local metals = require("metals")

local metals_config = metals.bare_config()

-- Example of settings
-- metals_config.settings = {
--   showImplicitArguments = true,
--   excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
-- }

local lsp_buf_set_keymaps = require("plug-config/lsp-buf-set-keymaps")

local on_attach = function(client, bufnr)
	-- require("metals").setup_dap()

	lsp_buf_set_keymaps(bufnr)
end

metals_config.on_attach = on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

local setup = function()
	metals.initialize_or_attach(metals_config)
end

local nvim_metals_group = vim.api.nvim_create_augroup("setup-nvim-metals", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = nvim_metals_group,
	pattern = { "scala", "sbt" },
	callback = setup,
})
