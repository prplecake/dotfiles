# matthew's dotfiles

**Note: This README is severely out of date.**

I used [henrik's dotfiles](https://github.com/henrik/dotfiles) as a
guide for creating my own system. Then I decided that system wasn't
working for me. So in May 2019, I rewrote most of it. The new system is
closer to [holman's dotfiles](https://github.com/holman/dotfiles). I
took some organizational tips from his repository as well as modeled my
shell script after theirs.

## Install

```
$ git clone https://git.sr.ht/~mjorgensen/dotfiles ~/.dotfiles
$ ~/.dotfiles/scripts/bootstrap
```

The shell script will ask what to do if the destination file already
exists. You can either overwrite it, skip it, or back it up. You'd also
have the option to overwrite all, skip all, or back all up.

The dotfiles will be symlinks, e.g. `~/zsh/zshrc.symlink` will be
symlinked to `~/.zshrc`.

### XDG Config Files

We can also track XDG config files. To link them, use this bootstrap
command:

```
$ ~/.dotfiles/scripts/bootstrap --with-xdg
```

## Currently Installed Submodules

- [oh-my-zsh][oh-my-zsh] - `/oh-my-zsh`
- [vim-fugitive][vim-fugitive] - `/vim/bundle/vim-fugitive`

[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[vim-fugitive]: https://github.com/tpope/vim-fugitive.git

Add a new plugin:

```
# E.g.:
git submodule add https://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive
```

Install submodule updates:

```
git submodule update --init
```

## Extras

The `extras` directory contains additional configuration files that are
not dotfiles:

* `VibrantInk.itermcolors` is a color scheme for [iTerm2][it2] 
  ([source][VIsource]).
* On a new Mac, run `~/.dotfiles/extras/macos_defaults.sh` in the
  Terminal to change some silly defaults.
* Includes a `Brewfile` for Homebrew on macOS.

[it2]: http://www.iterm2.com/
[VIsource]: https://github.com/asanghi/vibrantinklion
