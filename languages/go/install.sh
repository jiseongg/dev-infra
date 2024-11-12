#!/usr/bin/env bash

script_dir=$(cd $(dirname $0); pwd)

GOROOT=$HOME/.go


mkdir -p $GOROOT
curl -L https://go.dev/dl/go1.23.3.darwin-arm64.tar.gz | \
  tar -C $GOROOT --strip-components=1 -xz 

cat $script_dir/zshrc >> $HOME/.zshrc