[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
export VI_MODE_ESC_INSERT="jk" && plug "zap-zsh/vim"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Just in case
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Git aliases
alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin"
alias gb="git branch"
alias gbD="git branch -D"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gpl="git pull origin"
alias grb="git rebase -i"
alias gsa="git stash apply"
alias gre="git reset"

# Nicer alternatives to common commands
alias cat="bat"
alias ls="eza -lg --icons --group-directories-first"
alias la="eza -lag --icons --group-directories-first"
alias lr="eza -lTg -L 2 --icons --group-directories-first" # Recurse 2 levels
alias lR="eza -lTg --icons --group-directories-first" # Recurse until end (may be slow)

# Faster navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Cool prompt
eval "$(starship init zsh)"

