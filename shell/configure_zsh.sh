#!/usr/bin/env bash

SHELL_DIR=$(cd $(dirname $0); pwd)

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i "" \
  "s/^ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" \
  $HOME/.zshrc

# zshrc
cp -rf $SHELL_DIR/zfunc $HOME/.zfunc
cat $SHELL_DIR/zshrc >> $HOME/.zshrc

