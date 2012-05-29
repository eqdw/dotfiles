PROMPT="`/Users/eqdw/src/wunderprompt/prompt $?`"

[ $TERM = "eterm-color" ] && setopt singlelinezle
[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
