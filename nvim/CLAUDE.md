# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a personal Neovim configuration built with Lazy.nvim as the plugin manager and Mason for LSP/tooling management. The configuration is structured with:

- `init.lua`: Main entry point with global settings, keymaps, and module loading
- `lua/plugins.lua`: Plugin specifications for Lazy.nvim
- `lua/mvh/lazymason.lua`: Plugin manager and LSP server setup
- `lua/mvh/*.lua`: Feature-specific configuration modules

### Key Architectural Decisions

**LSP Management**: LSP servers are managed through Mason, with explicit setup in `lua/mvh/lazymason.lua`. Rust is a special case - rustaceanvim manages rust-analyzer independently, and the standard lspconfig setup is explicitly disabled (line 44 in lazymason.lua).

**Module Loading**: `init.lua` loads configuration modules in this order:
1. lazymason (plugins and LSP)
2. folding
3. format
4. fzf
5. treesitter
6. lsp
7. dap
8. marks

**Auto-formatting**: Files are automatically formatted on save via the formatter.nvim autocommand in `lua/mvh/format.lua`.

## LSP Server Configuration

LSP servers are configured in `lua/mvh/lazymason.lua`:
- taplo (TOML)
- lua_ls (Lua)
- pyright (Python)
- clangd (C/C++)
- r_language_server (R)
- rust_analyzer (managed by rustaceanvim, NOT lspconfig)

To add a new LSP server:
1. Add to `ensure_installed` in `lua/mvh/lazymason.lua`
2. Add configuration: `vim.lsp.config.<server_name> = {}`

Note: This config uses the new `vim.lsp.config` API (Neovim 0.11+), not the deprecated `require('lspconfig')` framework.

## Formatter Configuration

Formatters are configured per-filetype in `lua/mvh/format.lua`:
- Lua: stylua
- Rust: rustfmt
- Python: ruff (expects `.venv/bin/ruff`)
- C/C++: clang-format (IndentWidth: 4)
- SQL: pgformat
- JSON: jq
- TOML: taplo

Python formatting assumes a local virtualenv at `./.venv/bin/ruff`.

## Key Bindings

Leader key: `<Space>`

Common mappings:
- `<Leader>f`: FZF file search
- `<Leader>b`: Buffer list
- `<Leader><Leader>`: Switch to last buffer
- `<Leader>a`: Rust code actions (RustLsp)
- `<C-space>`: LSP hover
- `gd`: Go to definition
- `gr`: Find references
- `;`: Arrow marks menu (file marks)
- `m`: Arrow buffer marks
- `<Leader>dt`: Toggle DAP breakpoint
- `<Leader>dr`: Toggle DAP REPL

## Debugging (DAP)

Debug adapter configured for Rust using lldb at `/Users/41745/.cargo/bin/rust-lldb`. Configuration includes Rust pretty-printers initialization.

## Dependencies

External tools required:
- fzf at `/opt/homebrew/bin/fzf`
- ripgrep (for FZF_DEFAULT_COMMAND)
- clang-format (C/C++ formatting)
- stylua (Lua formatting)
- ruff (Python formatting in virtualenv)
- rustfmt (Rust formatting)
