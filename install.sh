#!/bin/bash

mkdir -p ~/.config/nvim/
mkdir -p ~/.tmux/plugins/
mkdir -p ~/.local/share/nvim/

bashrc_path=~/.bashrc
if test -f "$bashrc_path"; then
  mv $bashrc_path ~/.bashrc.old
fi

tmux_conf=~/.tmux.conf
if test -f "$tmux_conf"; then
  mv $tmux_conf ~/.tmux.conf.old
fi

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim package manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# just ln -s things
ln -s ~/src/dotfiles/bashrc ~/.bashrc
ln -s ~/src/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/src/dotfiles/init.vim ~/.config/nvim/init.vim
