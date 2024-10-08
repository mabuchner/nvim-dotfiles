local config = function()
    local null_ls = require("null-ls")

    local mason_null_ls = require("mason-null-ls")

    null_ls.setup({
        debounce = 1000,
        sources = {
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.cmake_format,
            -- null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.goimports.with({
                args = {
                    "-srcdir",
                    "$DIRNAME",
                    "-local",
                    "git.byted.org,code.byted.org",
                    "-format-only",
                },
            }),
            -- null_ls.builtins.formatting.gofumpt,
            -- null_ls.builtins.formatting.goimports_reviser,
            -- null_ls.builtins.formatting.golines,
            null_ls.builtins.formatting.scalafmt,
            null_ls.builtins.formatting.shellharden,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.diagnostics.cppcheck.with({
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                args = {
                    "--enable=warning,style,performance,portability",
                    "--template=gcc",
                    "--language=c++",
                    "$FILENAME",
                },
            }),
            null_ls.builtins.diagnostics.gitlint,
            -- null_ls.builtins.diagnostics.golangci_lint,
            null_ls.builtins.diagnostics.markdownlint.with({
                args = {
                    "--stdin",
                    "--disable MD013", -- Max line length
                },
            }),
            -- null_ls.builtins.diagnostics.proselint,
            null_ls.builtins.diagnostics.pylint,
            require("none-ls-shellcheck.diagnostics"),
            null_ls.builtins.diagnostics.vint,
            null_ls.builtins.diagnostics.write_good,
            require("none-ls-shellcheck.code_actions"),
            null_ls.builtins.completion.spell.with({
                filetypes = {
                    "markdown",
                    "tex"
                }
            })
        },
    })

    mason_null_ls.setup({
        ensure_installed = nil,
        automatic_installation = {
            exclude = {
                "cmake_format",
                "cppcheck",
                "scalafmt",
            },
        },
        automatic_setup = false,
    })

    --[[
mason_null_ls.setup()

mason_null_ls.setup_handlers({
    function(source_name, methods)
        -- To keep the original functionality of `automatic_setup = true`,
        -- please add the below.
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
    cmake_format = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.cmake_format)
    end,
    cppcheck = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.cppcheck.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            args = {
                "--enable=warning,style,performance,portability",
                "--template=gcc",
                "--language=c++",
                "$FILENAME",
            },
        }))
    end,
    gitlint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.gitlint)
    end,
    markdownlint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.markdownlint.with({
            args = {
                "--stdin",
                "--disable MD013", -- Max line length
            },
        }))
    end,
    prettier = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.prettier)
    end,
    proselint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.proselint)
        null_ls.register(null_ls.builtins.code_actions.proselint)
    end,
    scalafmt = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.scalafmt)
    end,
    shellcheck = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.shellcheck)
        null_ls.register(null_ls.builtins.code_actions.shellcheck)
    end,
    shellharden = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.shellharden)
    end,
    shfmt = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.shfmt)
    end,
    spell = function(source_name, methods)
        null_ls.register(null_ls.builtins.completion.spell)
    end,
    vint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.vint)
    end,
    write_good = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.write_good)
    end,
})

null_ls.setup()
--]]
end

return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "gbprod/none-ls-shellcheck.nvim",
            "nvimtools/none-ls-extras.nvim",
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = config,
    },
}
