# -------------------- Main configuration --------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jonathan"

plugins=(git)

source $ZSH/oh-my-zsh.sh
export GPG_TTY=$(tty)

source <(fzf --zsh)

export LESS="--LINE-NUMBERS --chop-long-lines --RAW-CONTROL-CHARS --UNDERLINE-SPECIAL --hilite-unread --use-color --color=Crl+"
export MANPAGER=less



alias py=python3
bindkey '^H' backward-kill-word
bindkey '5~' kill-word


