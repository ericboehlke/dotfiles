#! /bin/bash

# Ask questions
read -p "Do you wish to swap capslock and esc? (y/n): " capsyn
read -p "Do you wish to install ROS2? (y/n): " rosyn

# Add necessary packages

## Neovim 
sudo add-apt-repository ppa:neovim-ppa/stable -y

## Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt upgrade
sudo apt install -y \
	neovim \
	htop \
	git \
	tmux \
    curl \
    apt-transport-https \
    brave-browser

sudo apt autoremove -y

# Remove password feedback
sudo rm -f /etc/sudoers.d/0pwfeedback

# Swap ESC and CAPSLOCK
if [[ $capsyn =~ [Yy] ]]; then
    echo 'setxkbmap -option caps:swapescape' >> $HOME/.profile
fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless -c 'PlugInstall' -c 'qall'

# Make neovim the default editor
echo 'export EDITOR="nvim"' >> $HOME/.bashrc

# Get dotfiles
if [ ! -d $HOME/.local/bin/dotfiles ]; then
	mkdir -p $HOME/.local/bin
	mkdir -p $HOME/.config/nvim
	git clone https://github.com/ericboehlke/dotfiles.git $HOME/.local/bin/dotfiles
	ln -s $HOME/.local/bin/dotfiles/.tmux.conf $HOME/.tmux.conf 
	ln -s $HOME/.local/bin/dotfiles/init.vim $HOME/.config/nvim/init.vim 
fi

# Install ROS2 Galactic
if [[ $rosyn =~ [Yy] ]]; then
    sudo apt install locales gnupg lsb-release python3-colcon-common-extensions -y
    sudo locale-gen en_US en_US.UTF-8
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
    export LANG=en_US.UTF-8
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
    sudo apt update && sudo apt install ros-galactic-desktop -y
    echo 'source /opt/ros/galactic/setup.bash' >> $HOME/.bashrc
fi
