local opts = function()
    local navic = require("nvim-navic")

    return {
        options = {
            icons_enabled = true,
            theme = "auto",
            -- component_separators = { left = '', right = ''},
            -- section_separators = { left = '', right = ''},
            component_separators = { left = "", right = "|" },
            section_separators = "",
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    "filename",
                    path = 1, -- Show relative path
                },
            },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    "filename",
                    path = 1, -- Show relative path
                },
            },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {
            lualine_a = {
                {
                    "tabs",
                    max_length = vim.o.columns,
                    mode = 2, -- Show tab no. + tab name
                    tabs_color = {
                        active = "lualine_a_normal",
                        inactive = "lualine_b_inactive",
                    },
                },
            },
        },
        winbar = {
            lualine_a = {},
            lualine_b = {
                {
                    function()
                        if not navic.is_available() then
                            return ">"
                        end
                        local location = navic.get_location()
                        if location == "" then
                            return ">"
                        end
                        return location
                    end,
                    --[[
                    cond = function()
                        return navic.is_available()
                    end,
                    --]]
                },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            "fugitive",
            "fzf",
            "quickfix",
        },
    }
end

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = opts,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "SmiteshP/nvim-navic",
        },
    },
}
