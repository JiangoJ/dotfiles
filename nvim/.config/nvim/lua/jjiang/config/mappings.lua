local function map(m, k, v, desc, buf)
    local opts = { noremap = true, silent = true, desc = desc }
    if buf then
        opts.buffer = buf
    end
    vim.keymap.set(m, k, v, opts)
end

-- reload
map("n", "<leader>R", ":so %<CR>", "Reload neovim config")
map("", "<Space>", "<Nop>", "")

-- buffers
map("n", "<Tab>", ":bnext<CR>", "Next Buffer")
map("n", "<S-Tab>", ":bprevious<CR>", "Previous Buffer")
map("n", "<leader>x", function()
    if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
        vim.cmd("bp | bd #")
    else
        vim.cmd("bd")
    end
end, "Close Buffer")
map("n", "<leader>X", ":bd!<CR>", "Force Close Buffer")
map("n", "<leader>U", ":bufdo bd<CR>", "Close All Buffers")
map("n", "<leader>vs", ":vsplit<CR>:bnext<CR>", "VSplit Next Buffer")

-- windows - ctrl nav, fn resize
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to below window")
map("n", "<C-k>", "<C-w>k", "Move to above window")
map("n", "<C-l>", "<C-w>l", "Move to right window")
map("n", "<F5>", ":resize +2<CR>", "Increase height")
map("n", "<F6>", ":resize -2<CR>", "Decrease height")
map("n", "<F7>", ":vertical resize +2<CR>", "Increase width")
map("n", "<F8>", ":vertical resize -2<CR>", "Decrease width")

-- exit terminal insert
map("t", "<C-x>", "<C-\\><C-n>", "Exit terminal insert mode")

-- misc
map("n", "<leader>s", ":%s//g<Left><Left>", "Replace All")

-- erase highlights on esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear highlights")

-- tmux session
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Tmux sessionizer")

-- LSP keymaps (only active when LSP is attached)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local b = args.buf
        local telescope = require("telescope.builtin")

        -- Navigation
        map("n", "gd", telescope.lsp_definitions, "Go to definition", b)
        map("n", "gi", telescope.lsp_implementations, "Go to implementation", b)
        map("n", "gr", telescope.lsp_references, "Show references", b)
        map("n", "gt", telescope.lsp_type_definitions, "Go to type definition", b)

        -- Diagnostics
        map("n", "<leader>d", telescope.diagnostics, "Diagnostics", b)

        -- Info
        map("n", "K", vim.lsp.buf.hover, "Hover documentation", b)
        map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help", b)

        -- Actions
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol", b)
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action", b)
        map("n", "<leader>f", function()
            vim.lsp.buf.format({
                -- only use null-ls
                filter = function(client)
                    return client.name == "null-ls"
                end,
            })
        end, "Format buffer", b)

        -- Diagnostics
        map("n", "]d", function()
            vim.diagnostic.goto_next()
            vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end, "Next diagnostic (float)", b)
        map("n", "[d", function()
            vim.diagnostic.goto_prev()
            vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end, "Prev diagnostic (float)", b)
    end,
})
