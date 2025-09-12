require("config/options")
require("config/keymaps")
require("config/lazy")

local RyanGibsonGroup = vim.api.nvim_create_augroup("RyanGibson", {})
local YankGroup = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({ higroup = "Visual", timeout = 500 })
	end,
	group = YankGroup,
	pattern = "*",
})
