#!/bin/sh

export DOT_FILE_DIR=`echo $(cd $(dirname $0) && pwd)`

ln -sf $DOT_FILE_DIR/Brewfile ~/.Brewfile
ln -sf $DOT_FILE_DIR/zshrc ~/.zshrc

