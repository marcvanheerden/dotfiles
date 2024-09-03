-- Set the PATH environment variable to include the desired fzf binary
local fzf_path = "/opt/homebrew/bin/fzf"

-- Prepend the fzf_path to the PATH environment variable
vim.env.PATH = fzf_path .. ":" .. vim.env.PATH

-- hotkey for file search fzf
vim.api.nvim_set_keymap("n", "<Leader>f", ":FZF<CR>", { noremap = true, silent = true })
vim.fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --hidden")

-- helper function for searching buffers with fzf
vim.cmd([[
  command! Buffers
        \ call fzf#vim#buffers({
        \   'options': [
        \     '--preview', 
        \     'echo {} | cut -d '' '' -f 3- | xargs bat --style=numbers --color=always --line-range :500',
        \   ],
        \   'down': '40%',
        \   'header': 'Open Buffers'
        \ })
]])
