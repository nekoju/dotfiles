#!/bin/sh

# Add some logic here
git clone --single-branch --branch servers https://github.com/nekoju/dotfiles.git ~/dotfiles \
	|| cd ~/dotfiles && git pull --rebase

files=( .bashrc .aliases .gitconfig .gitaliases .bash_profile )
for file in "${files[@]}"; do
    echo linking "$file"
    mv ~/"$file" ~/"$file".bak \
        && ln -sf ~/dotfiles/"$file" ~/"$file" \
        && echo done
done
||||||| parent of 920fa00 (Add install script--untested.)
echo "All possible dotfiles linked"
echo "Done 🤘🏼"
