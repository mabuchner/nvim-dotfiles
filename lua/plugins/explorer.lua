return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                sources = {
                    "filesystem",
                    -- "buffers",
                    "git_status",
                    "document_symbols",
                },
                -- source_selector provides clickable tabs to switch between sources.
                source_selector = {
                    winbar = true,
                    -- statusline = true,
                    sources = {
                        {
                            source = "filesystem",
                            display_name = " 󰉓 Files ",
                        },
                        -- { source = "buffers" },
                        {
                            source = "git_status",
                            display_name = " 󰊢 Git ",
                        },
                        {
                            source = "document_symbols",
                            display_name = " 󰌗 Symbols ",
                        },
                    },
                },

                -- Fix for Nerd Font v3
                default_component_configs = {
                    icon = {
                        folder_empty = "󰜌",
                        folder_empty_open = "󰜌",
                    },
                    git_status = {
                        symbols = {
                            renamed = "󰁕",
                            unstaged = "󰄱",
                        },
                    },
                },
                document_symbols = {
                    kinds = {
                        File = { icon = "󰈙", hl = "Tag" },
                        Namespace = { icon = "󰌗", hl = "Include" },
                        Package = { icon = "󰏖", hl = "Label" },
                        Class = { icon = "󰌗", hl = "Include" },
                        Property = { icon = "󰆧", hl = "@property" },
                        Enum = { icon = "󰒻", hl = "@number" },
                        Function = { icon = "󰊕", hl = "Function" },
                        String = { icon = "󰀬", hl = "String" },
                        Number = { icon = "󰎠", hl = "Number" },
                        Array = { icon = "󰅪", hl = "Type" },
                        Object = { icon = "󰅩", hl = "Type" },
                        Key = { icon = "󰌋", hl = "" },
                        Struct = { icon = "󰌗", hl = "Type" },
                        Operator = { icon = "󰆕", hl = "Operator" },
                        TypeParameter = { icon = "󰊄", hl = "Type" },
                        StaticMethod = { icon = "󰠄 ", hl = "Function" },
                    },
                },
            })
            vim.keymap.set("n", "<leader>ef", "<Cmd>Neotree toggle<CR>")
            vim.keymap.set("n", "<leader>eg", "<Cmd>Neotree git_status toggle<CR>")
            vim.keymap.set("n", "<leader>es", "<Cmd>Neotree document_symbols toggle<CR>")
        end,
    }
}
