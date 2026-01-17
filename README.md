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
git clone https://github.com/chonalchendo/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install GNU Stow if not already installed
brew install stow

# Stow all configs
stow wezterm tmux nvim zsh opencode

# Install tmux plugins (after starting tmux)
# Press: ` then I
```

## Keybindings

### tmux (Prefix: `` ` `` backtick)

The prefix key is the **backtick** (`` ` ``) - the key to the left of `1`. Press it, release, then press the action key.

#### AI Agents

| Keys | Action |
|------|--------|
| `` ` `` → `o` | New window with OpenCode |
| `` ` `` → `O` | Split right with OpenCode |
| `` ` `` → `i` | New window with Claude Code |
| `` ` `` → `I` | Split right with Claude Code |
| `` ` `` → `n` | New window with Neovim |
| `` ` `` → `p` | OpenCode popup (temporary) |
| `` ` `` → `P` | Claude popup (temporary) |

#### Window Navigation

| Keys | Action |
|------|--------|
| `` ` `` → `h` | Previous window |
| `` ` `` → `l` | Next window |
| `` ` `` → `1-9` | Jump to window number |
| `` ` `` → `Tab` | Toggle last window |
| `` ` `` → `w` | Visual window picker |

#### Window/Pane Management

| Keys | Action |
|------|--------|
| `` ` `` → `c` | New window |
| `` ` `` → `/` | Split horizontal |
| `` ` `` → `-` | Split vertical |
| `` ` `` → `m` | Toggle zoom pane |
| `` ` `` → `j/k` | Resize pane down/up |

#### Sessions

| Keys | Action |
|------|--------|
| `` ` `` → `s` | Session switcher (fzf popup) |
| `` ` `` → `S` | New session prompt |
| `` ` `` → `X` | Kill session |

#### Other

| Keys | Action |
|------|--------|
| `` ` `` → `r` | Reload tmux config |
| `` ` `` → `` ` `` | Type a literal backtick |

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
