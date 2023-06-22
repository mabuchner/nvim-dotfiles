local opts = { noremap = true, silent = true }

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.keymap.set("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local dap_continue = function()
    -- Try to load '.vscode/launch.json', which can be used to configure the debugger
    if vim.fn.filereadable(".vscode/launch.json") then
        require("dap.ext.vscode").load_launchjs(nil, { lldb = { "c", "cpp", "rust" } })
    end
    require("dap").continue()
end

local dap_set_conditional_breakpoint = function()
    vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
        if input == nil then
            return
        end
        require("dap").set_breakpoint(input)
    end)
end

local dap_set_log_point = function()
    vim.ui.input({ prompt = "Log point message: " }, function(input)
        if input == nil then
            return
        end
        require("dap").set_breakpoint(nil, nil, input)
    end)
end

local lsp_buf_set_keymaps = function(bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local buffer_opts = {
        buffer = bufnr,
        noremap = true,
        silent = true,
    }

    -- LSP
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", buffer_opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", buffer_opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", buffer_opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", buffer_opts)
    vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", buffer_opts)
    vim.keymap.set(
        "n",
        "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        buffer_opts
    )
    vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", buffer_opts)
    vim.keymap.set({ "v", "n" }, "<space>ca", vim.lsp.buf.code_action, buffer_opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", buffer_opts)
    vim.keymap.set({ "v", "n" }, "<space>f", function()
        vim.lsp.buf.format({
            async = true,
            filter = function(client)
                return client.name ~= "gopls" -- Use gofmt / gofumpt for formatting
            end,
        })
    end, buffer_opts)

    -- Debugger
    vim.keymap.set("n", "<F5>", dap_continue, { buffer = bufnr })
    vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>", buffer_opts)
    vim.keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>", buffer_opts)
    vim.keymap.set("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>B", dap_set_conditional_breakpoint, buffer_opts)
    vim.keymap.set("n", "<space>lp", dap_set_log_point, buffer_opts)
    vim.keymap.set("n", "<space>dr", "<cmd>lua require('dap').repl.open()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>dl", "<cmd>lua require('dap').run_last()<CR>", buffer_opts)
    vim.keymap.set("n", "<M-k>", "<cmd>lua require('dapui').eval()<CR>", buffer_opts)
    vim.keymap.set("v", "<M-k>", "<cmd>lua require('dapui').eval()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>df", "<cmd>lua require('jdtls').test_class()<CR>", buffer_opts)
    vim.keymap.set("n", "<space>dn", "<cmd>lua require('jdtls').test_nearest_method()<CR>", buffer_opts)
end

return lsp_buf_set_keymaps
