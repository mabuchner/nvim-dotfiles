local jdtls = require("jdtls")
local jdtls_setup = require("jdtls.setup")
local lsp_buf_set_keymaps = require("plug-config/lsp-buf-set-keymaps")

local java8_path = "/usr/local/opt/openjdk@8/libexec/openjdk.jdk"
local java17_path = "/usr/local/opt/openjdk@17/libexec/openjdk.jdk"

local java8_home = java8_path .. "/Contents/Home"
local java17_home = java17_path .. "/Contents/Home"

local java17 = java17_home .. "/bin/java"

local home_dir = os.getenv("HOME")
-- local lsp_install_dir = "/usr/local/opt/jdtls/libexec"
local lsp_install_dir = home_dir .. "/devel/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository"
local lsp_jar = vim.fn.glob(lsp_install_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local lsp_jar_config = lsp_install_dir .. "/config_mac"

-- Here you can configure eclipse.jdt.ls specific settings
-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
-- for a list of options
-- More settings can get found at: https://github.com/eclipse/eclipse.jdt.ls/blob/master/org.eclipse.jdt.ls.core/src/org/eclipse/jdt/ls/core/internal/preferences/Preferences.java
-- Also helpful: https://github.com/redhat-developer/vscode-java/#setting-the-jdk
local settings = {
	java = {
		home = java17_home,
		configuration = {
			-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
			-- And search for `interface RuntimeOption`
			-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
			runtimes = {
				{
					name = "JavaSE-1.8",
					path = java8_home,
					default = true,
				},
			},
		},

		completion = {
			-- Use Indeed's preferred import order
			importOrder = {
				"",
				"javax",
				"java",
				"#",
			},
		},
		format = {
			comments = { enabled = true },
			enabled = true,
			onType = { enabled = false },
			settings = {
				-- url = "https://code.corp.indeed.com/code-style/IntelliJ-Java/-/raw/master/indeed-code-style-2018-2.xml",
				-- url = "file://Users/mbuchner/indeed/indeed-code-style-2018-2.xml",
				-- profile = "", -- Optional
			},
		},

		contentProvider = { preferred = "fernflower" },
		signatureHelp = { enabled = true },

		debug = {
			telemetry = {
				telemetryLevel = "off",
			},
		},
	},
}

local get_bundles = function()
	local bundles = {
		vim.fn.glob(
			home_dir .. "/devel/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
		),
	}

	vim.list_extend(bundles, vim.split(vim.fn.glob(home_dir .. "/devel/vscode-java-test/server/*.jar"), "\n"))

	return bundles
end

local init_options = {
	bundles = get_bundles(),
	extendedClientCapabilities = {
		-- Switching to standard LSP progress events (as soon as it lands, see link)
		-- https://github.com/eclipse/eclipse.jdt.ls/pull/2030#issuecomment-1210815017
		progressReportProvider = false,
	},
}

local on_attach = function(client, bufnr)
	-- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
	-- you make during a debug session immediately.
	-- Remove the option if you do not want that.
	jdtls.setup_dap({ hotcodereplace = "auto" })

	-- Add Jdt... Vim command
	jdtls_setup.add_commands()

	lsp_buf_set_keymaps(bufnr)
end

local status_callback = function(_, result)
	-- Disable 'Downloading ... Please press enter' status messages
	-- vim.notify(result.message, "info")
end

local get_workspace_dir_from_cwd = function()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	return home_dir .. "/workspace/" .. project_name
end

local start_or_attach = function()
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	local cmd = {
		java17,

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx8G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		lsp_jar,

		"-configuration",
		lsp_jar_config,

		"-data",
		get_workspace_dir_from_cwd(),
	}

	-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
	jdtls.start_or_attach({
		cmd = cmd,
		settigns = settings,
		init_options = init_options,
		on_attach = on_attach,
		handlers = {
			["language/status"] = status_callback,
		},
	})
end

local jdtls_lsp_group = vim.api.nvim_create_augroup("setup-nvim-jdtls", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = jdtls_lsp_group,
	pattern = { "java" },
	callback = start_or_attach,
})
