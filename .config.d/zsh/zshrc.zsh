export NAME="Tim Herd"
export EMAIL="tim.herd@coupa.com"

export EDITOR="/usr/bin/vim"
export PAGER="less"

export GIT_AUTHOR_NAME=$NAME
export GIT_COMMITTER_NAME=$NAME
export GIT_AUTHOR_EMAIL=$EMAIL
export GIT_COMMITTER_EMAIL=$EMAIL
export RUBYOPT="rubygems"

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=1000

setopt \
  appendhistory \
  autocd \
  prompt_subst \
  auto_pushd \
  pushd_silent \
  correct \
  nomatch

fpath=($fpath $HOME/.config.d/zsh/func)
typeset -u fpath

bindkey -v

autoload -Uz colors
colors

. ~/.config.d/zsh/prompts.zsh
. ~/.config.d/zsh/titles.zsh
. ~/.config.d/zsh/completion.zsh
. ~/.config.d/zsh/functions.zsh
. ~/.config.d/zsh/aliases.zsh
. ~/.config.d/zsh/osx.zsh
. ~/.zshrc.local


function project_precmd() {
  if [ -z $1 ]; then
    export PROJECT_ROOT=$(cd $(project_precmd .); pwd -P)
  else
    if [[ -d $1/.git || -f $1/Rakefile || -f $1/Makefile ]]; then
      echo $1
    else
      if [[ $(cd $1; pwd -P) == / ]]; then
        echo .
      else
        echo $(project_precmd $1/..)
      fi
    fi
  fi
}

precmd_functions+=(project_precmd)
[[ -s "/Users/eqdw/.rvm/scripts/rvm" ]] && source "/Users/eqdw/.rvm/scripts/rvm"
