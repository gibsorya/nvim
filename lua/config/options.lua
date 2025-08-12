local g = vim.g
local opt = vim.opt
local o = vim.o
-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true

-- Make line numbers default
vim.o.number = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable mouse mode, can be useful for resizing splits for example!
o.mouse = "a"

-- Sync clipboard between OS and Neo
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
	o.clipboard = "unnamedplus"
	o.clipboard = "unnamedplus"
end)

-- Enable break indent
o.breakindent = true

o.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
o.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10
-- Show which line your cursor is on
o.cursorline = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
o.confirm = true
o.confirm = true
