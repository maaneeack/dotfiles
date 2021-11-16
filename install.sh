#!/bin/bash

# .make.sh (.install.sh)
# create symlinks in home to any files in ~/dotfiles

# variables
dir=~/dotfiles 			# where our dotfiles are
olddir=~/dotfiles_old 		# old dotfiles backup
files="bashrc profile vimrc zshrc" 	# list of files/folders to symlink in home

# create dotfiles_old
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir
echo "...done"

# change to dotfiles dir
echo "Moving to $dir"
cd $dir
echo "...done"

# move existing dotfiles to dotfiles_old
for file in $files; do
	echo "Saving existing dotfiles to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Now symlinking our dotfiles..."
	ln -s $dir/$file ~/.$file
done
