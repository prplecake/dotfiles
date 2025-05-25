# matthew's dotfiles

[Tracker](https://todo.sr.ht/~prplecake/dotfiles)

## Setup

```
$ git clone --recursive https://git.sr.ht/~prplecake/dotfiles ~/.dotfiles
$ ~/.dotfiles/scripts/install.sh
```

The shell script will ask what to do if the destination file already
exists. You can either overwrite it, skip it, or back it up. You'd also
have the option to overwrite all, skip all, or back all up.

The dotfiles will be symlinks, e.g. `~/zsh/zshrc.symlink` will be
symlinked to `~/.zshrc`. In short, the script looks for any file or
directory endling in `.symlink`, and creates a link in `$HOME`.

### XDG Config Files

We can also track XDG config files. You'll be asked if you want to link
them. Similarly to `.symlink`, any file or directory ending in
`.xdgconfig` will have a link created in `$HOME/.config`.

## Zsh

### `ZSH_CUSTOM`

Custom functions are found in `zsh/custom_functions.sh`. For
organizational purposes, autocompletion setups are kept in
`zsh/autocompletions.sh`. 

### Currently Installed Submodules

- [oh-my-zsh][oh-my-zsh] - `/oh-my-zsh`
- [vim-fugitive][vim-fugitive] - `/vim/bundle/vim-fugitive`

[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[vim-fugitive]: https://github.com/tpope/vim-fugitive

Add a new plugin:

```
# E.g.:
git submodule add https://github.com/ohmyzsh/ohmyzsh.git oh-my-zsh
git submodule init
```

## Extras

The `contrib` directory contains additional configuration files that are
not dotfiles:

* `VibrantInk.itermcolors` is a color scheme for [iTerm2][it2] 
  ([source][VIsource]).
* On a new Mac, run `~/.dotfiles/contrib/macos_defaults.sh` in the
  Terminal to change some silly defaults.

[it2]: http://www.iterm2.com/
[VIsource]: https://github.com/asanghi/vibrantinklion
