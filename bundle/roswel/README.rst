
======================
ROsWeL vim syntax file
======================

This is a VIM syntax file for ROsWeL (Resource oriented workflow language) by `Andrzej Stroiński <http://www.cs.put.poznan.pl/anstroinski/>`_.

Installation
============

You can install syntax file for pathogen by doing::

    cd ~/.vim/bundle
    git clone git://github.com/tdi/vim-roswel-syntax.git

Manual install::

    git clone git://github.com/tdi/vim-roswel-syntax.git
    cp -R vim-roswel-syntax/syntax/* ~/.vim/syntax/
    cp -R vim-roswel-syntax/ftdetect/* ~/.vim/ftdetect/
   

The plugin should work out of the box, however if you want to specify filetypes manually, add the following line to your ``.vimrc``::

    au BufRead, BufNewFile *.roswel setfiletype roswel



License
=======

Copyright (c) Dariusz Dwornikowski. Distributed under the same license as VIM ``:help license``.
