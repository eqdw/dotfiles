export NAME="Tim Herd"
export EMAIL="rz@eqdw.net"

export EDITOR="/usr/bin/vim"
export PAGER="less"

export GIT_AUTHOR_NAME=$NAME
export GIT_COMMITTER_NAME=$NAME
export GIT_AUTHOR_EMAIL=$EMAIL
export GIT_COMMITTER_EMAIL=$EMAIL
export RUBYOPT="rubygems"

export PATH=/usr/local/bin:$PATH

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

fpath=($fpath $HOME/.config/zsh/func)
typeset -u fpath

bindkey -v

autoload -Uz colors
colors

. ~/.config/zsh/prompts.zsh
. ~/.config/zsh/titles.zsh
. ~/.config/zsh/completion.zsh
. ~/.config/zsh/functions.zsh
. ~/.config/zsh/aliases.zsh
. ~/.config/zsh/osx.zsh
. ~/.config/zsh/ruby.zsh
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
