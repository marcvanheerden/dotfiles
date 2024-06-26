require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"dockerfile",
		"query",
		"rust",
		"python",
		"r",
		"sql",
		"toml",
		"yaml",
		"json",
		"csv",
		"css",
		"bash",
		"vimdoc",
		"markdown",
		"typescript",
		"html",
		"javascript",
        "make",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})
