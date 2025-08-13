return {
    {
        "romgrk/barbar.nvim",
        config = function()
            vim.g.barbar_auto_setup = false

            require("barbar").setup({
                icons = {
                    pinned = { button = '', filename = true },
                },
            })
        end,
    },
}
