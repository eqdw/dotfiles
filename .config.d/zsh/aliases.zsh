function linux() { [[ `uname -s` = "Linux"  ]] }
function mac()   { [[ `uname -s` = "Darwin" ]] }

# rails
alias "b"="bundle"
alias "bi"="bundle install"
alias "bu"="bundle update"
alias "be"="bundle exec"
alias "ber"="bundle exec rails"
alias "burke"="bundle exec rails console"
alias "trt"="touch tmp/restart.txt"
alias "rR"="rake routes"
alias "rRg"="rake routes | grep"


function bergm() {
  $EDITOR `bundle exec rails generate migration $1 | tail -n1 | awk '{print $3}'`
}

function def() {
  ack "def $*"
}

# git
alias "gpl"="git pull"
alias "gps"="git push"
alias "gst"="git status"
alias "gco"="git checkout"
alias "ga"="git add"
alias "ga."="git add ."
alias "gc"="git commit"
alias "gcm"="git commit -m"


#serve up current directory
function server {
   ruby -rwebrick -e's=WEBrick::HTTPServer.new(:Port=>9999,:DocumentRoot=>Dir.pwd);trap("INT"){s.stop};s.start' 
}

#console utils
alias "ka9"="killall -9"
alias "k9"="kill -9"
alias "psag"="ps aux | grep "
alias "ls"="ls -FG "
alias "cd.."="cd .."
alias ".."="cd .."
alias "u"="cd .."
alias "uu"="cd ../.."
alias "uuu"="cd ../../.."
alias "uuuu"="cd ../../../.."
alias "uuuuu"="cd ../../../../.."
alias "uuuuuu"="cd ../../../../../.."

alias "tarx"="tar xzvf"
function tarc(){
  arg=$1
  tar czvf "$1.tar.gz" "$1"
}
