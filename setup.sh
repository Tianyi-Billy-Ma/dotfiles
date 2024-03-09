#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"/bash
mkdir -p "$XDG_CONFIG_HOME"/alacritty
mkdir -p "$XDG_CONFIG_HOME"/alacritty/themes
mkdir -p "$XDG_CONFIG_HOME"/tmux
git clone https://github.com/alacritty/alacritty-theme "$XDG_CONFIG_HOME"/alacritty/themes

# ln -s ./.amethyst.yml "$HOME"/.amethyst.yml
ln -sf "$PWD/alacritty/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml
ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.inputrc" "$HOME"/.inputrc
ln -sf "$PWD/tmux/.tmux.conf" "$XDG_CONFIG_HOME"/tmux/.tmux.conf
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
# ln -sf "$PWD/skhdrc" "$XDG_CONFIG_HOME"/skhd/skhdrc
ln -sf "$PWD/newsboat/config" "$HOME"/.newsboat/config
ln -sf "$PWD/newsboat/urls" "$HOME"/.newsboat/urls

# Packages
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew isntall --cask alacritty

brew install bash-completion@2 amethyst fzf newsboat

brew install neovim lazygit

# ubuntu packages apt
# sudo apt install ripgrep gh
#
# ubuntu apt neovim setup
# sudo apt install gcc g++ unzip
#
# ubuntu brew for vim and neovim setup
# sudo apt install fd fzf kubectl kubectx derailed/k9s/k9s
#
# ubuntu brew for neovim setup
# brew install neovim go lazygit
#
# ubuntu specific notes
# create symbolic link to neovim from vim when not using neovim on
# Ubuntu systems, because I use the v alias everywhere.
# sudo ln -sf /usr/bin/vim /usr/bin/nvim
