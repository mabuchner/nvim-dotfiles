local config = function()
    -- Show line diagnostics automatically in hover window
    vim.o.updatetime = 250
    -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
    -- For diagnostics at specific cursor position
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    local navic = require("nvim-navic")

    local lsp_buf_set_keymaps = require("plug-config/lsp-buf-set-keymaps")

    local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        end

        lsp_buf_set_keymaps(bufnr)
    end

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Specify offset encoding for clangd to avoid conflicts with null-ls
    local capabilities_clangd = cmp_nvim_lsp.default_capabilities()
    capabilities_clangd.offsetEncoding = "utf-8"

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
        ["clangd"] = function()
            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities_clangd,
                flags = lsp_flags,
            })
        end,
        ["rust_analyzer"] = function()
            lspconfig.rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                flags = lsp_flags,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            })
        end,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
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
end

return {
    {
        "neovim/nvim-lspconfig",
        config = config,
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Loading indicator
            {
                "j-hui/fidget.nvim",
                tag = "legacy", -- As recommended by the author while code is being rewritten
                config = true,
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
}
