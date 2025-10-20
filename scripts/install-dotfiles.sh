#!/bin/bash

if brew list alacritty &>/dev/null; then
    echo "Alacritty already installed"    
else
    brew install --cask alacritty
fi

if brew list font-fira-code-nerd-font &>/dev/null; then
    echo "font-fira-code-nerd-font is already installed"
else
    brew install font-fira-code-nerd-font
fi

mkdir ~/.config/alacritty
ln -s ~/alacritty/alacritty.toml  ~/.config/alacritty/alacritty.toml
