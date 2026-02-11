# My neovim configuration


Clone repository into `.config` directory

```sh
cd ~/.config
git clone https://github.com/mabuchner/nvim-dotfiles nvim
```

This configuration is uses the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager. The plugin manger and all plugins will get installed automatically.

Install LSPs

```
:LspInstall bashls clangd cmake dockerls html omnisharp lua_ls texlab tsserver
:NullLsInstall cmake_format latexindent
```

Mason-null-ls will also automatically try to install a few default sources.

The nvim-web-devicons plugin needs Nerd Fonts. Install Nerd Font as described [here](https://github.com/ryanoasis/nerd-fonts).

Then instruct your terminal to use it. E.g., with kitty add the following to the `kitty.conf` file

```
# `kitty list-fonts` can be used to get a list of font names
font_family SauceCodePro Nerd Font Mono
bold_font SauceCodePro Nerd Font Mono Bold
italic_font SauceCodePro Nerd Font Mono Italic
bold_italic_font SauceCodePro Nerd Font Mono Bold Italic
```
