#!/usr/bin/env bash

SHELL_DIR=$(cd $(dirname $0); pwd)

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i "" \
  "s/^ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" \
  $HOME/.zshrc


# plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i "" \
  "s/^plugins=\(.*\)/plugins=\(\n\tgit\n\tzsh-syntax-highlighting\n\tzsh-autosuggestions\n\)/" \
  $HOME/.zshrc


# zshrc
cp -rf $SHELL_DIR/zfunc $HOME/.zfunc
cat $SHELL_DIR/zshrc >> $HOME/.zshrc

