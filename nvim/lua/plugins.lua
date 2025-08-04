return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
	},
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
	"dewyze/vim-tada",
	"vim-airline/vim-airline",
	"junegunn/fzf",
	"junegunn/fzf.vim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({ dark_variant = "moon" })
			vim.cmd("colorscheme rose-pine")
		end,
	},
	"neovim/nvim-lspconfig",
	"mhartington/formatter.nvim",
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	"jmbuhr/otter.nvim",
	"mfussenegger/nvim-dap",
	{
		"otavioschwanck/arrow.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
    "lewis6991/gitsigns.nvim",
}
