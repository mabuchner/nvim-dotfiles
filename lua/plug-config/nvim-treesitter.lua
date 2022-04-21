require("nvim-treesitter.configs").setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"bash",
		"bibtex",
		"c",
		"c_sharp",
		"clojure",
		"cmake",
		"comment",
		"commonlisp",
		"cpp",
		"css",
		"dockerfile",
		"dot",
		"glsl",
		"go",
		"graphql",
		"help",
		"hjson",
		"html",
		"http",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"kotlin",
		"latex",
		"llvm",
		"lua",
		"make",
		"markdown",
		"ninja",
		"pascal",
		"perl",
		"php",
		"phpdoc",
		"python",
		"regex",
		"rst",
		"ruby",
		"rust",
		"scheme",
		"scss",
		"swift",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vue",
		"yaml",
		"zig",
	},

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- List of parsers to ignore installing
	ignore_install = {
		"norg", -- Fails to compile
	},

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- list of language that will be disabled
		-- disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})
