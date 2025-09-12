return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#000000",
            timeout = 3000, -- 3 seconds timeout
            stages = "fade_in_slide_out", -- Animation style
            render = "default", -- Render style
            minimum_width = 50,
            max_width = 80,
            max_height = 10,
            level = vim.log.levels.INFO,
            top_down = true, -- Show newer notifications at the top
            icons = {
                ERROR = " ",
                WARN = " ",
                INFO = " ",
                DEBUG = " ",
                TRACE = " ",
            },
        })
        
        -- Override vim.notify to use nvim-notify
        vim.notify = require("notify")
    end
}
