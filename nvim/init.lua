vim.g.mapleader = " "

-- install plugins and dependencies
require("mvh.lazymason")

vim.cmd("set number relativenumber")
vim.opt.ignorecase = true
vim.opt.clipboard:append("unnamedplus") -- sync system clipboard to nvim clipboard
vim.opt.virtualedit = "block" -- allow visual block mode to go beyond end of lines
vim.opt.termguicolors = true -- use terminals colour rules
vim.opt.wrap = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- map leader-b to buffer search
vim.api.nvim_set_keymap("n", "<Leader>b", ":Buffers<CR>", { noremap = true, silent = true })
-- map leader-leader to last buffer
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":b#<CR>", { noremap = true, silent = true })

-- center on search terms
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- paste current date or datetime
vim.api.nvim_set_keymap("n", "<Leader>n", [[<Cmd>put =strftime('%Y-%m-%d')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nn",
	[[<Cmd>put =strftime('%Y-%m-%d %H:%M:%S')<CR>]],
	{ noremap = true, silent = true }
)

-- change colour of pop up blocks
vim.cmd([[
  highlight NormalFloat guibg=#2E3440
  highlight FloatBorder guibg=#2E3440
]])

vim.diagnostic.config({
    virtual_lines = true,
})

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
  if
    msg
    and (
      msg:match 'position_encoding param is required'
      or msg:match 'Defaulting to position encoding of the first client'
      or msg:match 'multiple different client offset_encodings'
    )
  then
    return
  end
  return notify_original(msg, ...)
end

require("mvh.folding")
require("mvh.format")
require("mvh.fzf")
require("mvh.treesitter")
require("mvh.lsp")
require("mvh.dap")
require("mvh.marks")
