local g = vim.g

g.vimtex_compiler_silent = 1
g.vimtex_compiler_method = "latexmk"
g.vimtex_compiler_latexmk = {
	build_dir = "build",
}
g.vimtex_view_method = "skim"
