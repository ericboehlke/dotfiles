# My Dotfiles

## Neovim

### Installing Neovim

Because I am using lazy, I need to install Neovim 0.8.0+.
I installed the latest stable from source.
I placed the repository in `$HOME/src/neovim` and installed neovim in `$HOME/bin/`.

[Build Instructions](https://github.com/neovim/neovim/blob/master/BUILD.md)

### Installing Kitty

Lazy requires a terminal with true colors and undercurl.
I chose to use kitty.

I installed kitty using the [Binary Install](https://sw.kovidgoyal.net/kitty/binary/) method.
Then I ran the Desktop integration on Linux commands to get it to show up in my application menus.


### LazyVim

Install `ripgrep` and `fd`

```
sudo apt install ripgrep fd-find
```

```
:checkhealth telescope
```
