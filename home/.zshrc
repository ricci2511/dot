[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
export VI_MODE_ESC_INSERT="jk" && plug "zap-zsh/vim"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Git aliases
alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gb="git branch"
alias gbD="git branch -D"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gpl="git pull"
alias grb="git rebase -i"
alias gsa="git stash apply"

# Cool prompt
eval "$(starship init zsh)"

