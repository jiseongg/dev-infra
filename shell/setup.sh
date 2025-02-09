#!/usr/bin/env bash

SHELL_DIR=$(cd $(dirname $0); pwd)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# tmux
brew install iterm2 tmux
