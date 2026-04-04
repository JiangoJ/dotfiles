local M = {}

function M.set_transparent()
	local groups = {
		-- editor
		"Normal",
		"NormalNC",
		"SignColumn",
		"EndOfBuffer",
		"LineNr",
		"CursorLineNr",
		"FoldColumn",
		"VertSplit",
		"WinSeparator",
		"StatusLine",
		"StatusLineNC",

		-- nvim-tree
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"NvimTreeEndOfBuffer",
		"NvimTreeWinSeparator",
		"NvimTreeCursorLine",

		-- whichkey
		"WhichKeyFloat",
		"WhichKeyBorder",
		"WhichKeyNormal",
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE" })
	end
end

return M
