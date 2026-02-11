return {
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedvariable = true,
				unusedwrite = true,
			},
		},
	},
}
