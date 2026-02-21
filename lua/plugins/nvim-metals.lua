-- Scala LSP

local config = function()
    -- Based on https://github.com/scalameta/nvim-metals/discussions/39

    local metals = require("metals")

    local metals_config = metals.bare_config()

    -- Example of settings
    -- metals_config.settings = {
    --   showImplicitArguments = true,
    --   excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    -- }

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
end

return {
    {
        "scalameta/nvim-metals",
        ft = "scala",
        config = config,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
}
