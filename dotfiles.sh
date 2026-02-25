#!/bin/bash
set -eu

DOTFILES_REPO="https://github.com/gohar94/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

green=$(tput setaf 2 2>/dev/null || true)
reset=$(tput sgr0 2>/dev/null || true)

echo "${green}Installing dotfiles from $DOTFILES_REPO...${reset}"

if [ -d "$DOTFILES_DIR/.git" ]; then
    echo "${green}$DOTFILES_DIR already exists, pulling latest...${reset}"
    git -C "$DOTFILES_DIR" pull
else
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"
bash init.sh

echo "${green}Done! Dotfiles installed to $DOTFILES_DIR${reset}"
