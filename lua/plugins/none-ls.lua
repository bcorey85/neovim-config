return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					require("none-ls.diagnostics.eslint_d"),
					null_ls.builtins.formatting.prettier,
					require("none-ls.diagnostics.ruff"),
					require("none-ls.formatting.ruff"),
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}
