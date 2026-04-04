return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "morhetz/gruvbox",
        --"miikanissi/modus-themes.nvim",
    },
    config = function()
        vim.cmd.colorscheme("gruvbox")
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                separator_style = "slant",
                themable = true,
            custom_filter = function(buf_number)
                if vim.bo[buf_number].buftype == "terminal" then
                    return false
                end
                return true
            end,
            },
        })
    end,
}
