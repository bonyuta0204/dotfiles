#!/bin/bash

## run test
## check if dein install is succeed

echo "testing if dein is correctly installed"
if [ -d ~/.vim/dein/.cache/.vimrc/.dein];then
  echo "OK"
else
  echo "NG"
fi