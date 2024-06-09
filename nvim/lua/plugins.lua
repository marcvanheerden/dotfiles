return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
        lazy = false,
	}, --Completion framework:
	"hrsh7th/nvim-cmp", --LSP completion source:
	"hrsh7th/cmp-nvim-lsp", --Useful completion sources:
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/vim-vsnip",
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
	"quarto-dev/quarto-nvim",
	"jmbuhr/otter.nvim",
    "mfussenegger/nvim-dap",
}
