local config = function()
    local null_ls = require("null-ls")

    local mason_null_ls = require("mason-null-ls")

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.cmake_format,
            null_ls.builtins.formatting.latexindent,
            null_ls.builtins.formatting.scalafmt,
            null_ls.builtins.formatting.shellharden,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.chktex,
            null_ls.builtins.diagnostics.cppcheck.with({
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                args = {
                    "--enable=warning,style,performance,portability",
                    "--template=gcc",
                    "--language=c++",
                    "$FILENAME",
                },
            }),
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.diagnostics.gitlint,
            null_ls.builtins.diagnostics.jsonlint,
            null_ls.builtins.diagnostics.markdownlint.with({
                args = {
                    "--stdin",
                    "--disable MD013", -- Max line length
                },
            }),
            null_ls.builtins.diagnostics.proselint,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.vint,
            null_ls.builtins.diagnostics.write_good,
            null_ls.builtins.code_actions.eslint,
            null_ls.builtins.code_actions.proselint,
            null_ls.builtins.code_actions.shellcheck,
            null_ls.builtins.completion.spell,
        },
    })

    mason_null_ls.setup({
        ensure_installed = nil,
        automatic_installation = {
            exclude = {
                "cmake_format",
                "chktex",
                "cppcheck",
                "latexindent",
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
    chktex = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.chktex)
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
    eslint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.eslint)
        null_ls.register(null_ls.builtins.code_actions.eslint)
    end,
    flake8 = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.flake8)
    end,
    gitlint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.gitlint)
    end,
    jsonlint = function(source_name, methods)
        null_ls.register(null_ls.builtins.diagnostics.jsonlint)
    end,
    latexindent = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.latexindent)
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
    stylua = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.stylua)
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
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "jayp0521/mason-null-ls.nvim",
        config = config,
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
        },
    },
}
