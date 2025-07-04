-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Mason Setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = ">",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"taplo",
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"clangd",
		"r_language_server",
	},
})
