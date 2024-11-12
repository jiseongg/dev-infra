#!/usr/bin/env bash

# Node
echo "# Node" >> $HOME/.zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

zsh -c ". $HOME/.zshrc; nvm install 22"

