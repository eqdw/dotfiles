#colors!
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:#' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -U compinit
compinit

#cache!
#zstyle ':completion::complete:*' use-cache 1
