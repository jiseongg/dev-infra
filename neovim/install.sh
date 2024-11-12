#!/usr/bin/env bash

# LazyVim

brew update
brew install neovim

EXISTING_NVIM_CONFIGS=(
  .config/nvim
  .local/share/nvim
  .local/state/nvim
  .cache/nvim
)

for nvim_config in ${EXISTING_NVIM_CONFIGS[@]}; do
  if [[  -d $nvim_config ]]; then
    mv $HOME/$nvim_config $HOME/$nvim_config.bak
  fi
done

git clone https://github.com/LazyVim/starter $HOME/.config/nvim
rm -rf $HOME/.config/nvim/.git
