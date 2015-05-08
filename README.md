Vimrc

git clone https://github.com/tdi/vimrc.git ~/.vim/

ln -s ~/.vim/vimrc ~/.vimrc

cd ~/.vim/

git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim

vim +PluginInstall +qall

