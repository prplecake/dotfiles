.. Matthew's dotfiles documentation master file, created by
   sphinx-quickstart on Fri Mar 16 14:16:09 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

matthew's dotfiles docs
=======================

.. toctree::
   :maxdepth: 2
   :caption: Contents:

Installation
------------

New installation methods are under development.

Currently ruby is required to install this dotfiles manager.

Clone the repo into ``~/.dotfiles``::

    git clone https://github.com/mattjorgs/dotfiles.git ~/.dotfiles

Then install the dotfiles:

This WILL overwrite your current dotfiles. Installation program will ask before
overwriting. It is highly recommended to backup your files before you begin::

    cd ~/.dotfiles
    rake

The ``rake`` task will not replace existing files without asking first, it will
replace symlinks without asking.

The dotfiles will be symlinked, e.g.: ``~/.bash_profile`` will be symlinked to
:file:`~/.dotfiles/bash_profile`. Any changes made will be tracked by git.

Don't forget to replace to name and email in ``gitconfig`` if you're not Matthew!
