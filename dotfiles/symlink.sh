#!/usr/bin/env bash

dotfiles_home="${1:-$(dirname "$(realpath "$0")")}"
cp -rsf "$dotfiles_home"/. $HOME

echo "Dotfiles have been recursively copied and symlinked from $dotfiles_home to $HOME."
