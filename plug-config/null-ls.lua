local null_ls = require("null-ls");

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.formatting.shellharden,
        null_ls.builtins.formatting.shfmt,
        --null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.diagnostics.cppcheck.with({
            args = {
                "--enable=warning,style,performance,portability",
                "--template=gcc",
                "--language=c++",
                "$FILENAME"
            }
        }),
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.jsonlint,
        --null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.vint,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.completion.vsnip,
        null_ls.builtins.completion.spell,
    },
})
