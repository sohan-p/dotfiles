# Dotfiles

Personal configuration files for terminal, Neovim, and dev tools.

## What's Included

| Config | Path | Description |
|--------|------|-------------|
| **Zsh** | `shell/.zshrc` | Oh-My-Zsh + Powerlevel10k + fzf-tab + aliases |
| **Zprofile** | `shell/.zprofile` | Login shell env (JetBrains Toolbox PATH) |
| **Bash** | `shell/.bash_profile` | Bash profile (SDKMAN, OpenSSL) |
| **P10k** | `shell/.p10k.zsh` | Powerlevel10k prompt theme config |
| **Neovim** | `nvim/` | AstroNvim v5 with Java dev setup (jdtls, DAP, treesitter) |
| **Ghostty** | `ghostty/` | Ghostty terminal config (GPU accel, transparency) |
| **Git** | `git/.gitconfig` | Git config template |

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles

# 2. Run the installer (backs up existing configs, then symlinks)
cd ~/dotfiles
./install.sh

# 3. Set your git identity
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## How It Works

The install script creates **symlinks** from your home directory to the files in this repo. Your actual config files live here in `~/dotfiles`, so any changes you make are automatically tracked by git.

```
~/.zshrc          -> ~/dotfiles/shell/.zshrc
~/.zprofile       -> ~/dotfiles/shell/.zprofile
~/.bash_profile   -> ~/dotfiles/shell/.bash_profile
~/.p10k.zsh       -> ~/dotfiles/shell/.p10k.zsh
~/.config/nvim    -> ~/dotfiles/nvim
~/.config/ghostty -> ~/dotfiles/ghostty
~/.gitconfig      -> ~/dotfiles/git/.gitconfig
```

Existing files are backed up to `~/.dotfiles_backup/<timestamp>/` before being replaced.

## Uninstall

```bash
./uninstall.sh
```

Removes the symlinks. Restore your originals from `~/.dotfiles_backup/`.

## Dependencies

These need to be installed separately on a new machine:

- [Oh My Zsh](https://ohmyz.sh/#install)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - `brew install powerlevel10k`
- [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete) - `brew install zsh-autocomplete`
- [fzf](https://github.com/junegunn/fzf) - `brew install fzf`
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) - clone to `$ZSH_CUSTOM/plugins/fzf-tab`
- [Neovim](https://neovim.io/) - `brew install neovim`
- [lazygit](https://github.com/jesseduffield/lazygit) - `brew install lazygit`
- [nvm](https://github.com/nvm-sh/nvm) - `brew install nvm`
- [SDKMAN](https://sdkman.io/install) - for JDK management
- [Ghostty](https://ghostty.org/) - terminal emulator
- JDK 17+ (via SDKMAN: `sdk install java`)

## Adding New Configs

1. Add the config file/directory under an appropriate folder in `~/dotfiles/`
2. Add a `backup_and_link` line in `install.sh`
3. Add a `remove_link` line in `uninstall.sh`
4. Commit and push
