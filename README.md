# Dotfiles

My personal dotfiles for an AI-focused development workflow, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Overview

This setup is optimized for running multiple AI coding agents (OpenCode, Claude Code) in parallel while reviewing their work in Neovim.

### Tools

- **WezTerm** - Terminal emulator (minimal config, tmux handles everything)
- **cmux** - Native macOS terminal for parallel AI agents (vertical tabs + attention notifications)
- **tmux** - Session/window management with AI-specific keybindings
- **Neovim** - Editor with LSP, Telescope, and AI integration
- **Zsh** - Shell with Starship prompt (or Powerlevel10k)
- **Atuin** - AI-powered shell history with sync
- **Starship** - Minimal, fast, customizable prompt

### Theme

Consistent **Catppuccin Mocha** across all tools.

## Installation

```bash
# Clone the repo
git clone https://github.com/chonalchendo/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install dependencies
brew install stow atuin direnv starship fzf zoxide eza bat fd
brew install --cask cmux

# Stow all configs
stow wezterm tmux nvim zsh opencode starship cmux
# ghostty uses --no-folding so ~/.config/ghostty stays a real dir with files
# symlinked individually (cmux shares this config dir)
stow --no-folding ghostty

# Install tmux plugins (after starting tmux)
# Press: ` then I
```

### Atuin Setup (Shell History)

```bash
# Import existing shell history
atuin import auto

# Optional: Register for sync across machines
atuin register -u <username> -e <email>
atuin login -u <username>
```

### Switching Prompts

The default prompt is **Starship**. To switch to Powerlevel10k:

```bash
# Edit ~/.zshrc and change:
USE_STARSHIP=true
# to:
USE_STARSHIP=false
```

## Keybindings

### cmux (native macOS app, ⌘/⌃ chords)

cmux runs many AI agents as vertical sidebar tabs instead of tiled tmux panes, so 8+ Claude
Code sessions no longer clutter one window. Panes get a **blue ring** and tabs badge when an
agent needs your attention. Config lives at `cmux/.config/cmux/cmux.json` (stowed to
`~/.config/cmux/cmux.json`); reload with `cmux reload-config`.

| Keys | Action |
|------|--------|
| `⌘` + `P` | Workspace switcher (fuzzy picker) |
| `⌘` + `1`–`9` | Jump to workspace 1–9 |
| `⌃⌘` + `]` / `[` | Next / previous workspace |
| `⌘` + `N` | New workspace |
| `⌘` + `B` / `⌘⌥` + `B` | Toggle left / right sidebar |
| `⌘` + `T` | New surface (terminal tab within workspace) |
| `⌘⇧` + `]` / `[` | Next / previous surface |
| `⌃` + `1`–`9` | Jump to surface 1–9 |
| `⌘` + `D` / `⌘⇧` + `D` | Split right / down |
| `⌥⌘` + `←→↑↓` | Focus split pane directionally |
| `⌘⇧` + `↩` | Toggle pane zoom |
| `⌘` + `I` | Show notifications |
| `⌘⇧` + `U` | Jump to latest unread (agent needing attention) |

**Claude Code notifications** are enabled via `automation.claudeCodeIntegration` in
`cmux.json` — cmux's Claude wrapper injects the notification hooks automatically when you
launch `claude` inside a cmux terminal (no `~/.claude/settings.json` changes needed). Run
`cmux claude-teams` to launch Claude with a tmux→cmux shim so its splits become cmux panes.

### tmux (Prefix: `` ` `` backtick)

The prefix key is the **backtick** (`` ` ``) - the key to the left of `1`. Press it, release, then press the action key.

#### AI Agents

| Keys | Action |
|------|--------|
| `` ` `` + `o` | New window with OpenCode |
| `` ` `` + `O` | Split right with OpenCode |
| `` ` `` + `i` | New window with Claude Code |
| `` ` `` + `I` | Split right with Claude Code |
| `` ` `` + `n` | New window with Neovim |
| `` ` `` + `p` | OpenCode popup (temporary) |
| `` ` `` + `P` | Claude popup (temporary) |

#### Window Navigation

| Keys | Action |
|------|--------|
| `` ` `` + `h` | Previous window |
| `` ` `` + `l` | Next window |
| `` ` `` + `1-9` | Jump to window number |
| `` ` `` + `Tab` | Toggle last window |
| `` ` `` + `w` | Visual window picker |

#### Window/Pane Management

| Keys | Action |
|------|--------|
| `` ` `` + `c` | New window |
| `` ` `` + `/` | Split horizontal |
| `` ` `` + `-` | Split vertical |
| `` ` `` + `m` | Toggle zoom pane |
| `` ` `` + `j/k` | Resize pane down/up |

#### Sessions & Plugins

| Keys | Action |
|------|--------|
| `` ` `` + `e` | **SessionX** - Fuzzy session manager |
| `` ` `` + `f` | **Floax** - Floating terminal |
| `` ` `` + `t` | **Thumbs** - Quick copy (Vimium-style) |
| `` ` `` + `u` | **FZF-URL** - Extract & open URLs |
| `Ctrl` + `f` | **FZF** - General fzf integration |
| `` ` `` + `s` | Session switcher (fzf popup) |
| `` ` `` + `S` | New session prompt |
| `` ` `` + `X` | Kill session |

#### Other

| Keys | Action |
|------|--------|
| `` ` `` + `r` | Reload tmux config |
| `` ` `` + `` ` `` | Type a literal backtick |

### Neovim (Leader: `Space`)

| Keys | Action |
|------|--------|
| `<leader>ot` | Toggle OpenCode panel |
| `<leader>oa` | Ask OpenCode |
| `<leader>os` | Select OpenCode prompts |
| `<leader>on` | New OpenCode session |
| `<leader>ox` | Show diff of changes |
| `<leader>gd` | Diffview (review changes) |
| `<leader>gh` | File git history |
| `<leader>gq` | Close Diffview |
| `C-h/j/k/l` | Navigate tmux/nvim panes |

### Shell Functions & Aliases

#### Navigation

| Command | Action |
|---------|--------|
| `cx <dir>` | cd + list directory |
| `fcd` | Fuzzy cd into directory |
| `f` | Fuzzy file path to clipboard |
| `fv` | Fuzzy open file in nvim |
| `rr` | Ranger with cd-on-quit |

#### Git Worktrees

| Command | Action |
|---------|--------|
| `gwl` | List worktrees |
| `gwa` | Add worktree |
| `gwr` | Remove worktree |
| `gwp` | Prune worktrees |
| `gwn <branch>` | New branch + worktree + cd |
| `gwe <branch>` | Existing branch worktree + cd |
| `gwf` | Fuzzy switch between worktrees |

#### Git Shortcuts

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `gd` | `git diff` |
| `gl` | `git log --oneline --graph` |
| `glog` | Pretty git log with graph |
| `gco` | `git checkout` |
| `gb` | `git branch` |
| `gba` | `git branch -a` |
| `ga` | `git add` |
| `gap` | `git add -p` (interactive) |
| `gc` | `git commit` |
| `gcm` | `git commit -m` |
| `gca` | `git commit -a` |
| `gp` | `git pull` |
| `grb` | `git rebase` |
| `gst` | `git stash` |
| `gstp` | `git stash pop` |

#### AI Development

| Command | Action |
|---------|--------|
| `aidev <name> [dir]` | Create AI dev tmux session |
| `agents` | List running agent windows |
| `proj [name]` | Switch to project session |
| `kill-agents` | Kill all agent windows |
| `cc-night [on\|off\|status]` | Keep Mac awake (lid closed) for overnight cmux/Claude runs |
| `dots` | Open dotfiles in nvim |
| `oc` | OpenCode alias |
| `cc` | Claude Code alias |

#### Better Defaults

| Alias | Command |
|-------|---------|
| `v` | `nvim` |
| `lg` | `lazygit` |
| `cat` | `bat` |
| `ls` | `eza` with icons |
| `ll` | `eza -la` with icons |
| `tree` | `eza --tree` |
| `c` | `clear` |
| `reload` | `source ~/.zshrc` |

### Shell Keybindings

| Keys | Action |
|------|--------|
| `Ctrl+e` | Accept autosuggestion |
| `Ctrl+w` | Execute autosuggestion |
| `Ctrl+k` | History search up |
| `Ctrl+j` | History search down |
| `Ctrl+r` | Atuin history search |

## Structure

```
dotfiles/
├── wezterm/.wezterm.lua
├── ghostty/.config/ghostty/config
├── cmux/.config/cmux/cmux.json
├── tmux/.tmux.conf
├── nvim/.config/nvim/
├── zsh/.zshrc
├── zsh/.p10k.zsh
├── starship/.config/starship/starship.toml
└── opencode/.config/opencode/
```

## tmux Plugins

- **tpm** - Plugin manager
- **tmux-sensible** - Sensible defaults
- **tmux-yank** - Better copy/paste
- **vim-tmux-navigator** - Seamless pane navigation
- **tmux-resurrect** - Session persistence
- **tmux-continuum** - Auto-save sessions
- **tmux-sessionx** - Fuzzy session manager (omerxx)
- **tmux-floax** - Floating terminals (omerxx)
- **tmux-fzf-url** - URL extraction
- **tmux-thumbs** - Quick copy with hints
- **tmux-fzf** - FZF integration
- **catppuccin/tmux** - Theme

## Credits

Inspired by [omerxx/dotfiles](https://github.com/omerxx/dotfiles).
