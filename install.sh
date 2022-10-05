#!/bin/bash

# N.B. This script should be run with sudo
# (user_name can be set to the required user)
user_name="joe"
package_list="package_list.txt"
vundle_dir=/home/$user_name/.vim/bundle

while IFS= read -r line
do

	pacman -S --noconfirm "$line"

done < "$package_list"

sudo -i -u $user_name bash << EOF
stow git
stow bash
stow xsession
stow vim
stow i3
mkdir /home/$user_name/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
EOF
