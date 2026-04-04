return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- clang formatting to match nvim
				--null_ls.builtins.formatting.clang_format.with({
				--	extra_args = { "--style", "{IndentWidth: 4, TabWidth: 4}" },
				--	filetypes = { "c", "cpp", "objc", "objcpp" },
				--}),
			},
		})
		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format" })
	end,
}
