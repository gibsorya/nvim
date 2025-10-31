return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			auto_install = true,

			ensure_installed = {
				"lua_ls",
				"clangd",
				"ts_ls",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				lazy = false,
				opts = {
					auto_install = true,
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.diagnostic.config({
				virtual_text = true,
			})

			vim.lsp.config("clangd", {
				cmd = { "clangd", "--background-index" },
				init_options = {
					fallbackFlags = { "-std=c++20" },
				},
				on_new_config = function(new_config, new_cwd)
					local status, cmake = pcall(require, "cmake-tools")
					if status then
						cmake.clangd_on_new_config(new_config)
					end
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
