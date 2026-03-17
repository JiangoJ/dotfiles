local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- rtp is the RunTimePath for nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- prepend so lazy is found first
vim.opt.rtp:prepend(lazypath)

-- require searches for the lazy directory init.lua file, and returns
require("lazy").setup({
	spec = "jjiang.lazy",
	change_detection = { notify = false },
})
