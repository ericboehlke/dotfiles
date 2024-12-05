# My Dotfiles

## Place Dotfiles

```
ln -s /home/eric/code/dotfiles/.tmux.conf ~/.tmux.conf
ln -s /home/eric/code/dotfiles/nvim ~/.config/nvim
ln -s /home/eric/code/dotfiles/kitty ~/.config/kitty
ln -s /home/eric/code/dotfiles/lazygit ~/.config/lazygit
ln -s /home/eric/code/dotfiles/bat ~/.config/bat
echo -e "[include]\n    path = /home/eric/code/dotfiles/eric.gitconfig" >> ~/.gitconfig
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
echo "export PATH=\"\$PATH:\$HOME/.local/bin/neovim/bin\"" >> .bashrc
```

To update neovim
```
git fetch --tags --force
git checkout stable
```

### Installing Kitty

Lazy requires a terminal with true colors and undercurl.
I chose to use kitty.

I installed kitty using the [Binary Install](https://sw.kovidgoyal.net/kitty/binary/) method.
Then I ran the Desktop integration on Linux commands to get it to show up in my application menus.
The same command used to install can be used to update.
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

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
# sudo install lazygit /usr/local/bin
mv lazygit ~/.local/bin/lazygit
echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> .bashrc
```

### Delta
```
DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -Lo delta.tar.gz "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
tar xf delta.tar.gz --strip-components=1 -C ~/.local/bin delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu/delta
```

### Bat (to configure Delta syntax-theme)
```
BAT_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo bat_${BAT_VERSION}_amd64.deb "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
sudo dpkg -i bat_${BAT_VERSION}_amd64.deb
bat cache --build
```

### Install NPM and NodeJS

Install these for javascript development tools.

Use the second method that uses NodeSource in the article [here](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04).
