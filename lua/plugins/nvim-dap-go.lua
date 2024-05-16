local config = function()
	require("dap-go").setup({
        delve = {
            args = {
                "--check-go-version=false"
            }
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
