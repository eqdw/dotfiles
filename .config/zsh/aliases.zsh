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
alias "berspec"="be rspec -c"

function prRg() {

  rRg $* | ruby -e 'while (line = gets); line.gsub!(/^\s*/, ""); line.gsub!(/\s+\//, "\n/"); line.gsub!(/\s*\{/, "\n{"); line += "\n"; puts line; end'

}

function bergm() {
  $EDITOR `bundle exec rails generate migration $1 | tail -n1 | awk '{print $3}'`
}

function def() {
  ack "def $*"
}

function edit-gem(){
  vim `bundle show $1`
}
alias "gem-edit"="edit-gem"

# git
alias "g"="git"
alias "gpl"="git pull"
alias "gpls"="git pull; git push"
alias "gps"="git push"
alias "gst"="git status"
alias "gco"="git checkout"
alias "ga"="git add"
alias "ga."="git add ."
alias "grm"="git rm"
alias "gc"="git commit"
alias "gcm"="git commit -m"
alias "gdf"="git diff --color"
alias "gcp"="git cherry-pick"
alias "grs"="git reset"
alias "grsh"="git reset --hard"
alias "glg"="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset' --abbrev-commit --"
alias "gspl"="git stash && git pull && git stash pop"

#serve up current directory
function server {
   ruby -rwebrick -e's=WEBrick::HTTPServer.new(:Port=>9999,:DocumentRoot=>Dir.pwd);trap("INT"){s.stop};s.start' 
}

#console utils
alias "ka9"="killall -9"
alias "k9"="kill -9"
alias "psag"="ps aux | grep "
alias "ls"="ls -FGh "
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

# irc ssh tunnel
alias "irc_ssh"="ssh -L 6667:irc.freenode.net:6667"
