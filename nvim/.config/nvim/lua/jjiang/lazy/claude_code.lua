return {
    "greggh/claude-code.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
        require("claude-code").setup({
            window = {
                split_ratio = 0.3,
                position = "botright vertical",
                enter_insert = true,
                hide_numbers = false
            },
            keymaps = {
                toggle = {
                    normal = "<C-,>",
                    terminal = "<C-,>",
                }
            }
        })
    end
}
