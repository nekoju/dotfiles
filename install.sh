#!/bin/bash

# install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# install oh-my-posh
## Per website, may not work. Recommends falling back to homebrew.
echo "Installing oh-my-posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
## themes
echo "Installing OMP themes"
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

# clone dotfiles
echo "Cloning devhost branch of dotfiles repository"
git clone git@github.com:njuers/dotfiles.git --branch devhost ~/dotfiles


# backup existing dotfiles
echo "Creating backup directory"
mkdir -p ~/dotfiles-backup || true
# symlink dotfiles
while read -r line; do
    echo "Copying ~/$line to ~/dotfilesBackup/$line"
    cp -r ~/"$line" ~/dotfiles-backup && rm ~/"$line" || true
    echo "Linking ~/dotfiles/$line to ~/$line"
    ln -s ~/dotfiles/"$line" ~/"$line"
done < linked-dotfiles.txt
echo "All possible dotfiles linked"
echo "Done 🤘🏼"
