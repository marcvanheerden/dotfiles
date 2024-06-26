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
		python = require("formatter.filetypes.python").ruff,
		json = require("formatter.filetypes.json").jq,
		toml = require("formatter.filetypes.toml").taplo,
		c = require("formatter.filetypes.c").clangformat,
		cpp = require("formatter.filetypes.c").clangformat,
	},
})
