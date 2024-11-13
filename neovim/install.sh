#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# NeoVim
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

git config --global core.editor nvim
git config --global difftool.nvimdiff.cmd 'nvim -d "$LOCAL" "$REMOTE"'
git config --global diff.tool nvimdiff


# LazyVim
brew install fd ripgrep lazygit luarocks

cp -rf $SCRIPT_DIR/configs $HOME/.config/nvim

