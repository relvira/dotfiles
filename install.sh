#!/bin/bash

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim package manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# just ln -s things
ln -s ~/src/bashrc ~/.bashrc
ln -s ~/src/tmux ~/.tmux
ln -s ~/src/tmux.conf ~/.tmux.conf
ln -s ~/src/nvim ~/.config/nvim

