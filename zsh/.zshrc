# Source Prezto.

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz compinit
compinit

if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

unsetopt correctall

alias md5='python -c "import hashlib,sys; print hashlib.md5(sys.argv[1]).hexdigest()" '
alias sha1='python -c "import hashlib,sys; print hashlib.sha1(sys.argv[1]).hexdigest()" '
alias jst='python -c "import sys; from datetime import datetime, timedelta, timezone; print(datetime.fromisoformat(sys.argv[1].replace(\"Z\", \"+00:00\")).astimezone(tz=timezone(timedelta(hours=+9))))"'
alias idea='open -a "IntelliJ IDEA CE.app"'

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}

# for Ubuntu keybind
if type xmodmap >/dev/null 2>&1; then
  [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
fi

zle -N peco-select-history
bindkey '^r' peco-select-history

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

setopt hist_ignore_dups
setopt EXTENDED_HISTORY

export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
