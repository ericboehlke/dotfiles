# My Dotfiles

## Place Dotfiles

```
ln -s /home/eric/code/dotfiles/.tmux.conf ~/.tmux.conf
ln -s /home/eric/code/dotfiles/nvim ~/.config/nvim
ln -s /home/eric/code/dotfiles/kitty ~/.config/kitty
```

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
export PATH="$PATH:$HOME/.local/bin/neovim/bin"
```

### Installing Kitty

Lazy requires a terminal with true colors and undercurl.
I chose to use kitty.

I installed kitty using the [Binary Install](https://sw.kovidgoyal.net/kitty/binary/) method.
Then I ran the Desktop integration on Linux commands to get it to show up in my application menus.

Themes:
```
kitten themes
```


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

Install `ripgrep`, `fd`, and `xclip`

```
sudo apt install ripgrep fd-find xclip
```

```
:checkhealth telescope
```

### LazyGit
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

### Install NPM and NodeJS

Install these for javascript development tools.

Use the second method that uses NodeSource in the article [here](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04).
