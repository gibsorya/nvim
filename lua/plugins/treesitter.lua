return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "cpp", "cmake", "ruby", "lua", "javascript", "typescript", "json", "liquid" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
