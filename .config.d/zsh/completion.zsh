#colors!
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


autoload -U compinit
compinit

#cache!
#zstyle ':completion::complete:*' use-cache 1
