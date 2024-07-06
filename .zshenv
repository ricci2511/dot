export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export GIT_EDITOR='nvim'
export VISUAL='nvim'
export EDITOR='nvim'

export PATH=$HOME/go/bin:$PATH

# . "$HOME/.cargo/env"

# Make sure X-Server works on WSL (xclip, gui apps, etc)
# See: https://github.com/microsoft/WSL/issues/4106#issuecomment-876470388 (thanks @kvnptl)
if [[ $(uname -r) == *microsoft* ]]; then
  export DISPLAY=$(/mnt/c/Windows/System32/route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0
fi

