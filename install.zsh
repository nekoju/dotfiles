#!/bin/zsh

# Add some logic here
git clone --single-branch --branch devhost https://github.com/nekoju/dotfiles.git ~/dotfiles \
	|| cd ~/dotfiles && git pull
source ~/dotfiles/.zshrc
echo "Enjoy your defaults."
