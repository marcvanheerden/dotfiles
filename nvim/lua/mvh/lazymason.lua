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
		-- rust_analyzer is managed by rustaceanvim
		"pyright",
		"clangd",
		"r_language_server",
	},
	automatic_setup = false,
})

-- Manually set up LSP servers (prevents automatic duplicate setup)
-- Note: Using vim.lsp.config instead of deprecated require('lspconfig')

-- Configure LSP servers
vim.lsp.config.taplo = {}
vim.lsp.config.lua_ls = {}
vim.lsp.config.pyright = {}
vim.lsp.config.r_language_server = {}
-- clangd is set up in mvh/lsp.lua
-- rust_analyzer is managed by rustaceanvim, do NOT configure it here (just omit it)
