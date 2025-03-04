# Guide to full update of Neovim

## Neovim

1. Pull latest master branch 
2. run `make distclean` to clear out old build cruft
3. Check dependencies are installed 
4. Build from source 

## Lazy

Run :Lazy update 

## Mason 

Open Mason menu with :Mason 
Hit U to update all 

Packages installed with Mason but not in config:

- clangd
- codelldb
- lua-language-server > lua_ls
- pyright
- luaformatter 
- python-lsp-server > pylsp 
- stylua 
- r-languageserver > r_language_server
- rust-analyzer
- taplo
- tree-sitter-cli
- typescript-language-server > ts_ls

## Tree-sitter parsers  

Run :TSUpdate 
