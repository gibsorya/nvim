return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                auto_scroll = true,
                size = 20,
                direction = "horizontal",
                float_opts = {
                    border = "curved",
                    width = 120,
                    height = 20,
                    winblend = 3,
                    title_pos = "center",
                },
                persist_mode = false,
                shell = vim.o.shell,
            })
        end,
    },
}
