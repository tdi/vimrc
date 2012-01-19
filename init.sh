#!/bin/bash
# Thanks to http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
cd ~
git clone git://github.com/tdi/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
