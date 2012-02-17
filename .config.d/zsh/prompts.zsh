function build-prompt() {
    ret=$?
    case "$ret" in 
        0) statcolor="%{$fg[green]%}" ;;
        *) statcolor="%{$fg[red]%}$ret"   ;;
    esac 
    ruby=$(/Users/eqdw/src/prompt/ruby_info)
    git=$(/Users/eqdw/src/prompt/prompt 2>/dev/null)

    turbo=""
    if [[ $RUBY_HEAP_MIN_SLOTS == 1000000 ]] {
      turbo="X"
    }
    case `hostname` in
      zeltennia.local) pathcolor="%{$fg[cyan]%}" ;;
      zeltenia)        pathcolor="%{$fg[cyan]%}" ;;
      *)               pathcolor="%{$fg[red]%}"  ;;
    esac

    echo "$pathcolor%c %{$fg[red]%}$turbo$ruby $git $statcolor%#%{$reset_color%} "
}
PROMPT="`build-prompt`"

function build-rprompt() {
  echo "%{$fg[gray]%}%~ %l %h %*%{$fg[white]%}%{$fg[reset]%}"
}
RPROMPT="`build-rprompt`"

[ x$TERM = "xeterm-color" ] && setopt singlelinezle
[ x$TERM = "xdumb" ] && unsetopt zle && PS1='$ '
