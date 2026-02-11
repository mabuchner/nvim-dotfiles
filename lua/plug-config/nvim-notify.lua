local notify = require("notify")

notify.setup({
	-- Animation style (see below for details)
	stages = "fade_in_slide_out",

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()
	render = "default",

	-- Timeout for notifications
	timeout = 5000,

	-- Max number of columns for messages
	max_width = nil,
	-- Max number of lines for a message
	max_height = nil,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
	background_colour = "Normal",

	-- Minimum width for notification windows
	minimum_width = 50,

	-- Icons for the different levels
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

vim.notify = notify

local lsp_notify_group = vim.api.nvim_create_augroup("LSPNotify", { clear = true })

vim.api.nvim_create_autocmd({ "UIEnter" }, {
	once = true,
	callback = function()
		local Spinner = require("plug-config/nvim-notify-spinner")
		local spinners = {}

		local format_msg = function(msg, percentage)
			msg = msg or ""
			if not percentage then
				return msg
			end
			return string.format("%2d%%\t%s", percentage, msg)
		end

		local format_title = function(title, client_name)
			return title and string.format("%s: %s", client_name, title) or client_name
		end

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = { "LspProgressUpdate" },
			group = lsp_notify_group,
			desc = "LSP progress notifications",
			callback = function()
				-- TODO: use one spinner for all tokens of each client
				for _, client in ipairs(vim.lsp.get_active_clients()) do
					for token, progress_msg in pairs(client.messages.progress) do
						if not spinners[client.id] then
							spinners[client.id] = {}
						end
						local spinner = spinners[client.id][token]
						if not progress_msg.done then
							if not spinner then
								spinners[client.id][token] = Spinner(
									format_msg(progress_msg.message, progress_msg.percentage),
									vim.log.levels.INFO,
									{
										title = format_title(progress_msg.title, client.name),
									}
								)
							else
								spinner:update(format_msg(progress_msg.message, progress_msg.percentage))
							end
						else
							client.messages.progress[token] = nil
							if spinner then
								spinner:done(progress_msg.message or "Complete", nil, {
									icon = "",
								})
								spinners[client.id][token] = nil
							end
						end
					end
				end
			end,
		})
	end,
})
