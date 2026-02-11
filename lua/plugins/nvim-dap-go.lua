local config = function()
	require("dap-go").setup()
end

return {
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		config = config,
	},
}
