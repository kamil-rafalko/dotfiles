#!/bin/bash

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

if brew list alacritty &>/dev/null; then
    echo "Alacritty already installed"    
else
    brew install --cask alacritty
    mkdir ~/.config/alacritty
    ln -s ~/alacritty/alacritty.toml  ~/.config/alacritty/alacritty.toml
fi

if brew list font-fira-code-nerd-font &>/dev/null; then
    echo "font-fira-code-nerd-font is already installed"
else
    brew install font-fira-code-nerd-font
fi

if brew list tmux &>/dev/null; then
    echo "tmux is already installed"
else
    brew install tmux
fi

if brew list neovim &>/dev/null; then
    echo "neovim is already installed"
else
    brew install neovim
fi

