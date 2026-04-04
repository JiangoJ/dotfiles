return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup(
            {
                filters = {
                    dotfiles = false,
                    git_ignored = false
                },

                update_focused_file = {
                    enable = true,
                    update_root = false,
                },
                view = {
                    side = "left",
                    signcolumn = "no",
                },
                renderer = {
                    highlight_opened_files = "none",
                },
            }
        )
        -- Ctrl+n to toggle NvimTree
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {
            noremap = true,
            silent = true,
            desc = "Toggle file tree",
        })
    end
}
