-- Set the PATH environment variable to include the desired fzf binary
local fzf_path = "/opt/homebrew/bin/fzf"

-- Prepend the fzf_path to the PATH environment variable
vim.env.PATH = fzf_path .. ":" .. vim.env.PATH

-- hotkey for file search fzf
vim.api.nvim_set_keymap("n", "<Leader>f", ":FZF<CR>", { noremap = true, silent = true })
vim.fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --hidden")
