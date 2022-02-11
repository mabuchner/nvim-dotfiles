# My neovim configuration

Install [plug](https://github.com/junegunn/vim-plug)

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Clone repository into `.config` directory

```sh
cd ~/.config
git clone https://github.com/mabuchner/nvim-dotfiles nvim
```

Run nvim (ignore errors) and install plugins

```
nvim
:PlugInstall
```

Install LSPs

```
:LspInstall bashls clangd cmake dockerls html omnisharp sumneko_lua texlab tsserver
```


The nvim-web-devicons plugin needs Nerd Fonts. Install Nerd Font as described [here](https://github.com/ryanoasis/nerd-fonts).

Then instruct your terminal to use it. E.g., with kitty add the following to the `kitty.conf` file

```
# `kitty list-fonts` can be used to get a list of font names
font_family SauceCodePro Nerd Font Mono
bold_font SauceCodePro Nerd Font Mono Bold
italic_font SauceCodePro Nerd Font Mono Italic
bold_italic_font SauceCodePro Nerd Font Mono Bold Italic
```

