-- set leader
vim.g.mapleader = " "

-- Plugins
require("jjiang.lazy_init")

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()

-- Mappings
require("jjiang.config.ui")
require("jjiang.config.autocmd")
require("jjiang.config.mappings")
require("jjiang.config.options")
