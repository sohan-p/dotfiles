#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

info()  { printf "\033[1;34m[info]\033[0m  %s\n" "$1"; }
warn()  { printf "\033[1;33m[warn]\033[0m  %s\n" "$1"; }
ok()    { printf "\033[1;32m[ok]\033[0m    %s\n" "$1"; }

backup_and_link() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$(readlink -f "$dest" 2>/dev/null)" = "$(readlink -f "$src" 2>/dev/null)" ]; then
      ok "$dest -> already linked"
      return
    fi
    mkdir -p "$BACKUP_DIR"
    warn "Backing up $dest -> $BACKUP_DIR/"
    mv "$dest" "$BACKUP_DIR/"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  ok "$dest -> $src"
}

echo ""
echo "============================="
echo "  Dotfiles Installer"
echo "============================="
echo ""
info "Dotfiles directory: $DOTFILES_DIR"
echo ""

# --- Shell ---
info "Linking shell configs..."
backup_and_link "$DOTFILES_DIR/shell/.zshrc"        "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/shell/.zprofile"      "$HOME/.zprofile"
backup_and_link "$DOTFILES_DIR/shell/.bash_profile"  "$HOME/.bash_profile"
backup_and_link "$DOTFILES_DIR/shell/.p10k.zsh"      "$HOME/.p10k.zsh"

# --- Neovim ---
info "Linking nvim config..."
backup_and_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# --- Ghostty ---
info "Linking Ghostty config..."
backup_and_link "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

# --- Git ---
info "Linking git config..."
backup_and_link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

echo ""
echo "============================="
echo "  Post-install Steps"
echo "============================="
echo ""

if grep -q "GITUSER" "$DOTFILES_DIR/git/.gitconfig"; then
  warn "Update your git identity:"
  echo "  git config --global user.name \"Your Name\""
  echo "  git config --global user.email \"you@example.com\""
  echo ""
fi

info "Install dependencies if not already present:"
echo "  - oh-my-zsh:         https://ohmyz.sh/#install"
echo "  - powerlevel10k:     brew install powerlevel10k"
echo "  - zsh-autocomplete:  brew install zsh-autocomplete"
echo "  - fzf:               brew install fzf"
echo "  - fzf-tab:           git clone https://github.com/Aloxaf/fzf-tab \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
echo "  - lazygit:           brew install lazygit"
echo "  - neovim:            brew install neovim"
echo "  - nvm:               brew install nvm"
echo "  - sdkman:            https://sdkman.io/install"
echo ""
ok "Done! Restart your terminal or run: source ~/.zshrc"
