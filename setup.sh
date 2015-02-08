#!/bin/bash
cd ~/.vim/
mkdir ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim
vim +BundleInstall +qall

