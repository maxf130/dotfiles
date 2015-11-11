#!/bin/bash
############################
# .make.sh
# Create symlinks from the home directory to dotfiles in ~/etc/dotfiles
############################

########## Variables

dir=~/etc/dotfiles                    
olddir=~/etc/dotfiles.bak             
files="vimrc bashrc Xresources gitconfig zprofile zshenv zshrc xinitrc"

##########

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, 
#then create symlinks from the homedir to any files in the 
#~/dotfiles directory specified in $files
for file in $files; do
    mv ~/.$file $olddir/
    ln -s $dir/$file ~/.$file
done
