local configLLDB = function(dap)
    dap.adapters.lldb = {
        type = "executable",
        command = vim.fn.exepath("lldb-dap"),
        name = "lldb",
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},

            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
        },
        {
            -- If you get an "Operation not permitted" error using this, try disabling YAMA:
            --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            name = "Attach to process",
            type = "cpp", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
            request = "attach",
            pid = require("dap.utils").pick_process,
            args = {},
        },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

local config = function()
    local dap = require("dap")
    configLLDB(dap)

    local dapui = require("dapui")

    require("nvim-dap-virtual-text").setup()

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

    -- Debugger keymaps
    local dap_continue = function()
        -- Try to load '.vscode/launch.json', which can be used to configure the debugger
        if vim.fn.filereadable(".vscode/launch.json") then
            require("dap.ext.vscode").load_launchjs(nil, { lldb = { "c", "cpp", "rust" } })
        end
        require("dap").continue()
    end

    local dap_set_conditional_breakpoint = function()
        vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
            if input == nil then return end
            require("dap").set_breakpoint(input)
        end)
    end

    local dap_set_log_point = function()
        vim.ui.input({ prompt = "Log point message: " }, function(input)
            if input == nil then return end
            require("dap").set_breakpoint(nil, nil, input)
        end)
    end

    vim.keymap.set("n", "<F5>", dap_continue)
    vim.keymap.set("n", "<F10>", function() dap.step_over() end)
    vim.keymap.set("n", "<F11>", function() dap.step_into() end)
    vim.keymap.set("n", "<F12>", function() dap.step_out() end)
    vim.keymap.set("n", "<space>b", function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<space>B", dap_set_conditional_breakpoint)
    vim.keymap.set("n", "<space>lp", dap_set_log_point)
    vim.keymap.set("n", "<space>dr", function() dap.repl.open() end)
    vim.keymap.set("n", "<space>dl", function() dap.run_last() end)
    vim.keymap.set("n", "<M-k>", function() dapui.eval() end)
    vim.keymap.set("v", "<M-k>", function() dapui.eval() end)
    vim.keymap.set("n", "<space>df", function() require("jdtls").test_class() end)
    vim.keymap.set("n", "<space>dn", function() require("jdtls").test_nearest_method() end)
end

return {
    {
        "mfussenegger/nvim-dap",
        config = config,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },
    {
        "theHamsta/nvim-dap-virtual-text"
    },
}
