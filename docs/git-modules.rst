Git Modules
===========

`ooh-my-zsh <https://github.com/robbyrussell/oh-my-zsh>`_ is installed as a
submmodule in :file:`.dotfiles/oh-my-zsh`.

Add Modules
-----------

It's easy to add new submodules::

    git submodule add https://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive

Install plugins from submodules::

    git submodule update --init
