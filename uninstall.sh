#!/usr/bin/env bash
set -euo pipefail

info()  { printf "\033[1;34m[info]\033[0m  %s\n" "$1"; }
ok()    { printf "\033[1;32m[ok]\033[0m    %s\n" "$1"; }

remove_link() {
  local dest="$1"
  if [ -L "$dest" ]; then
    rm "$dest"
    ok "Removed symlink: $dest"
  else
    info "Not a symlink, skipping: $dest"
  fi
}

echo ""
echo "============================="
echo "  Dotfiles Uninstaller"
echo "============================="
echo ""

remove_link "$HOME/.zshrc"
remove_link "$HOME/.zprofile"
remove_link "$HOME/.bash_profile"
remove_link "$HOME/.p10k.zsh"
remove_link "$HOME/.config/nvim"
remove_link "$HOME/.config/ghostty"
remove_link "$HOME/.gitconfig"

echo ""
info "Symlinks removed. Restore backups from ~/.dotfiles_backup/ if needed."
