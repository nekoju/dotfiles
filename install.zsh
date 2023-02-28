#!/bin/zsh

git clone --single-branch --branch devhost https://github.com/nekoju/dotfiles.git ~/dotfiles-2
source ~/dotfiles/.zshrc
echo "Enjoy your defaults."
