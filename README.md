# My Dotfiles

## Neovim

### Installing Neovim

Because I am using lazy, I need to install Neovim 0.8.0+.
I installed the latest stable from source.
I placed the repository in `$HOME/src/neovim` and installed neovim in `$HOME/bin/`.
OR
I placed the repository in `$HOME/code/neovim` and installed neovim in `$HOME/.local/bin/neovim/`.

[Build Instructions](https://github.com/neovim/neovim/blob/master/BUILD.md)

```
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
sudo apt-get install ninja-build gettext cmake unzip curl
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/bin/neovim"
sudo make install
export PATH="$HOME/.local/bin/neovim/bin"
```

### Installing Kitty

Lazy requires a terminal with true colors and undercurl.
I chose to use kitty.

I installed kitty using the [Binary Install](https://sw.kovidgoyal.net/kitty/binary/) method.
Then I ran the Desktop integration on Linux commands to get it to show up in my application menus.


### LazyVim

Install FiraCode
https://www.nerdfonts.com/font-downloads
```
unzip FiraCode.zip -d FiraCode
sudo mv FiraCode /usr/local/share/fonts/
fc-cache -fv
```
For Mason
```
sudo apt install python3-venv
```

Install `ripgrep` and `fd`

```
sudo apt install ripgrep fd-find
```

```
:checkhealth telescope
```

