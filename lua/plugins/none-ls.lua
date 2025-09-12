return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style={BasedOnStyle: Google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 200, SortIncludes: Never}" },
                }),
				null_ls.builtins.diagnostics.rubocop,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
