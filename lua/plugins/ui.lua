return {
    -- Thin colorcolumn
    {
        "lukas-reineke/virt-column.nvim",
        config = true,
    },
    -- UI for vim.ui.select and vim.ui.input hooks
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    -- Show notifications
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        init = function()
            local notify = require("notify")

            notify.setup({
                -- Animation style (see below for details)
                stages = "fade_in_slide_out",

                -- Function called when a new window is opened, use for changing win settings/config
                on_open = nil,

                -- Function called when a window is closed
                on_close = nil,

                -- Render function for notifications. See notify-render()
                render = "default",

                -- Timeout for notifications
                timeout = 5000,

                -- Max number of columns for messages
                max_width = nil,
                -- Max number of lines for a message
                max_height = nil,

                -- For stages that change opacity this is treated as the highlight behind the window
                -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
                background_colour = "Normal",

                -- Minimum width for notification windows
                minimum_width = 50,

                -- Icons for the different levels
                icons = {
                    ERROR = "",
                    WARN = "",
                    INFO = "",
                    DEBUG = "",
                    TRACE = "✎",
                },
            })

            vim.notify = notify
        end,
    },
    {
        "kosayoda/nvim-lightbulb",
        opts = { autocmd = { enabled = true } },
    },
}
