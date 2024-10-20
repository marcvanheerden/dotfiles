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

-- Completion Plugin Setup
local cmp = require("cmp")
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		-- Add tab support
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	-- Installed sources:
	sources = {
		{ name = "path" }, -- file paths
		{ name = "nvim_lsp", keyword_length = 3 }, -- from language server
		{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
		{ name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = "buffer", keyword_length = 2 }, -- source current buffer
		{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = "calc" }, -- source for math calculation
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				vsnip = "⋗",
				buffer = "Ω",
				path = "~",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

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


require("quarto").setup({
	debug = false,
	closePreviewOnExit = true,
	lspFeatures = {
		enabled = true,
		chunks = "curly",
		languages = { "r", "python", "julia", "bash", "html" },
		diagnostics = {
			enabled = true,
			triggers = { "BufWritePost" },
		},
		completion = {
			enabled = true,
		},
	},
	codeRunner = {
		enabled = false,
		default_method = nil, -- 'molten' or 'slime'
		ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
		-- Takes precedence over `default_method`
		never_run = { "yaml" }, -- filetypes which are never sent to a code runner
	},
	keymap = {
		-- set whole section or individual keys to `false` to disable
		hover = "K",
		definition = "gd",
		type_definition = "gD",
		rename = "<leader>lR",
		format = "<leader>lf",
		references = "gr",
		document_symbols = "gS",
	},
})
