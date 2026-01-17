# Enable Powerlevel10k instant prompt. Should stay close to 
# the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.z# export 
export PATH="/opt/homebrew/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew: Python
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"

eval "$(pyenv init --path)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting 
# web-search)

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias python=/Users/conal/.pyenv/shims/python3
alias pip=/Users/conal/.pyenv/shims/pip3


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"


alias cd="z"

eval "$(zoxide init zsh)"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# =============================================================================
# FZF CONFIGURATION
# =============================================================================
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Pastel Catppuccin colors for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f5c2e7 \
--color=fg:#cdd6f4,header:#f5c2e7,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#a6e3a1,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f5c2e7 \
--color=selected-bg:#45475a \
--color=border:#b4befe,label:#cba6f7 \
--border=rounded --padding=1 \
--prompt='  ' --pointer='󰁕' --marker='󰄬' \
--multi"

# fzf preview settings
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || cat {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons {} | head -200'"

# =============================================================================
# EDITOR
# =============================================================================
export EDITOR="nvim"
export VISUAL="nvim"

# =============================================================================
# PASTEL COLORS FOR LS/EZA
# =============================================================================
# Use pastel colors with eza
export EZA_COLORS="da=38;5;183:di=38;5;117:ex=38;5;156:fi=38;5;252:ln=38;5;219:ur=38;5;223:uw=38;5;210:ux=38;5;156:gr=38;5;223:gw=38;5;210:gx=38;5;156:tr=38;5;223:tw=38;5;210:tx=38;5;156"

# =============================================================================
# COOL ZSH FEATURES
# =============================================================================
# Better history
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY       # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_VERIFY            # Show command before executing from history
setopt SHARE_HISTORY          # Share history between sessions

# Better navigation
setopt AUTO_CD                # cd by just typing directory name
setopt AUTO_PUSHD             # Push directories to stack
setopt PUSHD_IGNORE_DUPS      # Don't push duplicates
setopt PUSHD_SILENT           # Don't print stack after pushd/popd

# Better completion
setopt COMPLETE_IN_WORD       # Complete from cursor position
setopt ALWAYS_TO_END          # Move cursor to end after completion
setopt MENU_COMPLETE          # Auto-select first match

# =============================================================================
# ALIASES
# =============================================================================
# AI Development
alias oc="opencode"
alias cc="claude"
alias v="nvim"
alias lg="lazygit"

# Better defaults with pastel colors
alias cat="bat --style=plain --paging=never"
alias less="bat --style=plain"
alias tree="eza --tree --icons --color=always"
alias ll="eza -la --icons --color=always --group-directories-first"
alias la="eza -a --icons --color=always --group-directories-first"

# Git shortcuts
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate -10"
alias gp="git pull"
alias gc="git commit"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Misc
alias c="clear"
alias reload="source ~/.zshrc"

# =============================================================================
# AI DEVELOPMENT FUNCTIONS
# =============================================================================

# Create a new AI development tmux session with predefined layout
# Usage: aidev <session-name> [project-directory]
aidev() {
  local session_name="${1:-ai-dev}"
  local project_dir="${2:-.}"
  
  # Resolve to absolute path
  project_dir=$(cd "$project_dir" && pwd)
  
  # Check if session already exists
  if tmux has-session -t "$session_name" 2>/dev/null; then
    echo "Session '$session_name' already exists. Attaching..."
    tmux attach-session -t "$session_name"
    return
  fi
  
  # Create new session with nvim in first window
  tmux new-session -d -s "$session_name" -c "$project_dir"
  tmux rename-window -t "$session_name:1" "nvim"
  tmux send-keys -t "$session_name:1" "nvim" Enter
  
  # Create windows for agents
  tmux new-window -t "$session_name" -n "agent-1" -c "$project_dir"
  tmux new-window -t "$session_name" -n "agent-2" -c "$project_dir"
  tmux new-window -t "$session_name" -n "shell" -c "$project_dir"
  
  # Go back to nvim window and attach
  tmux select-window -t "$session_name:1"
  tmux attach-session -t "$session_name"
}

# List all running agent windows across all tmux sessions
agents() {
  echo "=== Running AI Agents ==="
  tmux list-windows -a 2>/dev/null | grep -E "(opencode|claude|agent)" || echo "No agents running"
}

# Quick switch to or create a project session
# Usage: proj <project-name>
proj() {
  local project_name="$1"
  
  if [[ -z "$project_name" ]]; then
    # No argument - show session picker
    tmux list-sessions -F '#{session_name}' 2>/dev/null | \
      fzf --reverse --header='Select Session' | \
      xargs -I {} tmux switch-client -t {}
    return
  fi
  
  # Check if session exists
  if tmux has-session -t "$project_name" 2>/dev/null; then
    tmux switch-client -t "$project_name"
  else
    echo "Session '$project_name' not found. Create with: aidev $project_name"
  fi
}

# Kill all agent windows (useful for cleanup)
kill-agents() {
  echo "Killing all agent windows..."
  tmux list-windows -a -F '#{session_name}:#{window_index} #{window_name}' 2>/dev/null | \
    grep -E "(opencode|claude)" | \
    cut -d' ' -f1 | \
    xargs -I {} tmux kill-window -t {}
  echo "Done."
}

# Dotfiles management
dots() {
  cd ~/dotfiles && nvim
}
