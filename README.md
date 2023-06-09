# neovim configuration

```shell
git clone https://github.com/thimc/nvim\
    ~/.config/nvim
```

Install packer.nvim:

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Install `go-tools`, `xclip`, `gopls`, `ripgrep` and `clangd`.

```shell
go install github.com/incu6us/goimports-reviser@latest
go install mvdan.cc/gofumpt@latest
go install github.com/segmentio/golines@latest
```

Start neovim and run `:PackerSync`.

[Keybindings](https://raw.githubusercontent.com/thimc/nvim/main/keybindings.md).
