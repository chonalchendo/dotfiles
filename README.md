# Dotfiles

My personal dotfiles for an AI-focused development workflow, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Overview

This setup is optimized for running multiple AI coding agents (OpenCode, Claude Code) in parallel while reviewing their work in Neovim.

### Tools

- **WezTerm** - Terminal emulator (minimal config, tmux handles everything)
- **tmux** - Session/window management with AI-specific keybindings
- **Neovim** - Editor with LSP, Telescope, and AI integration
- **Zsh** - Shell with oh-my-zsh + powerlevel10k

### Theme

Consistent **Catppuccin Mocha** across all tools.

## Installation

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install GNU Stow if not already installed
brew install stow

# Stow all configs
stow wezterm tmux nvim zsh opencode

# Install tmux plugins (after starting tmux)
# Press: C-Space I
```

## Keybindings

### tmux (Prefix: `C-Space`)

| Keys | Action |
|------|--------|
| `a o` | New window with OpenCode |
| `a c` | New window with Claude Code |
| `a n` | New window with Neovim |
| `a O` | Split right with OpenCode |
| `a C` | Split right with Claude Code |
| `a w` | Apply AI layout (60/40 split) |
| `s` | Session switcher (fzf popup) |
| `S` | New session prompt |
| `/` | Split horizontal |
| `-` | Split vertical |
| `c` | New window |
| `m` | Toggle zoom pane |
| `h/j/k/l` | Resize panes |

### Neovim (Leader: `Space`)

| Keys | Action |
|------|--------|
| `<leader>ao` | Toggle OpenCode terminal |
| `<leader>ac` | Toggle Claude terminal |
| `<leader>gd` | Diffview (review changes) |
| `<leader>gh` | File git history |
| `<leader>gq` | Close Diffview |
| `C-\` | Toggle terminal |
| `C-h/j/k/l` | Navigate tmux/nvim panes |

### Shell Functions

| Command | Action |
|---------|--------|
| `aidev <name> [dir]` | Create AI dev tmux session |
| `agents` | List running agent windows |
| `oc` / `cc` | Quick agent aliases |

## Structure

```
dotfiles/
├── wezterm/.wezterm.lua
├── tmux/.tmux.conf
├── nvim/.config/nvim/
├── zsh/.zshrc
├── zsh/.p10k.zsh
└── opencode/.config/opencode/
```
