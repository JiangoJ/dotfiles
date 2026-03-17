-- close nvim-tree if it's last buffer open
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
			vim.cmd("quit")
		end
	end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Map startime
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
		vim.g.startup_time_ms = string.format("%.2f ms", startuptime * 1000)
	end,
})

-- Transparent Colorscheme
local ui = require("jjiang.config.ui")
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		ui.set_transparent()
	end,
})
vim.cmd.colorscheme("gruvbox")

-- Linting
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.lsp.buf.format({
			-- only use null-ls
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Semi-transparent cursorline
vim.opt.cursorline = true

-- Calculate scrolloff
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.opt.scrolloff = math.floor(vim.api.nvim_win_get_height(0) * 0.2)
	end,
})
vim.opt.scrolloff = math.floor(vim.api.nvim_win_get_height(0) * 0.2)
