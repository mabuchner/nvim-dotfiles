local config = function()
    require("dap-go").setup({
        delve = {
            initialize_timeout_sec = 30,
            args = {
                "--check-go-version=false",
            },
        }
    })
end

return {
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = config,
    },
}
