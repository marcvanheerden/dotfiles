-- auto-format files on save
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
	false
)

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		rust = require("formatter.filetypes.rust").rustfmt,
		sql = require("formatter.filetypes.sql").pgformat,
		python = {
			function()
				return {
					exe = "./.venv/bin/ruff",
					args = {
						"format",
						"-q",
						"-",
					},
					stdin = true,
				}
			end,
		},
		json = require("formatter.filetypes.json").jq,
		toml = require("formatter.filetypes.toml").taplo,
		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-style='{IndentWidth: 4}'",
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						"-style='{IndentWidth: 4}'",
						"-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
				}
			end,
		},
		--c = require("formatter.filetypes.c").clangformat,
		--cpp = require("formatter.filetypes.c").clangformat,
	},
})
