local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = true })

vim.keymap.set("n", "<C-space>", function()
	vim.lsp.buf.hover()
end, { silent = true })

vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { silent = true })

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.lsp.inlay_hint.enable()
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

local nvim_lsp = require("lspconfig")
nvim_lsp.pyright.setup({})

nvim_lsp.clangd.setup({
	on_attach = function(client, bufnr)
		-- Key mappings and other configuration details go here
	end,
	flags = {
		debounce_text_changes = 150,
	},
})

