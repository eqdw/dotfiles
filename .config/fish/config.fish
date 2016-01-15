# most of this file thanks to github.com/burke

function fish_prompt ; /Users/eqdw/src/wunderprompt-fish/prompt $status ; end

set fish_greeting ""

function mac   ; test (uname -s) = "Darwin" ; end
function linux ; test (uname -s) = "Linux"  ; end


set -x EDITOR vim
set -x NAME "Tim Herd"
set -x EMAIL rz@eqdw.net

set -x PAGER less
set -x GIT

set -x GIT_AUTHOR_NAME $NAME
set -x GIT_COMMITTER_NAME $NAME
set -x GIT_AUTHOR_EMAIL $EMAIL
set -x GIT_COMMITTER_EMAIL $EMAIL
set -x RUBYOPT "rubygems"
set -x PATH /usr/local/bin $PATH

# so that we actually know I'm running FISH
set -x FISH "Very Yes"


##### My Git Config #####
# I do this here instead of checking in .gitconfig because I need to be able to 
# override it on a per-machine basis
git config --global push.default current
git config --global color.ui true
### END My Git Config ###


##### MISC #####
function def    ; ag "def (self\.)?$argv"   ; end
function class  ; ag "class (\w+::)*$argv"  ; end
function module ; ag "module (\w+::)*$argv" ; end

function bergm ; e (bundle exec rails generate migration $argv[1] | tail -n1 | awk '{print $3}') ; end
function elm   ; e db/migrate/(ls db/migrate | tail -n1) ; end

function cpip
  set ip (ifconfig en0 | grep 'inet[^6]' | awk '{print $2}' | tail -n1)
  echo $ip | pbcopy
  echo $ip
end

function pyserv
  echo http://(ifconfig en0 | grep 'inet[^6]' | awk '{print $2}' | tail -n1):8000 | pbcopy
  python -m SimpleHTTPServer
end

function ka9    ; killall -9 $argv                  ; end
function k9     ; kill -9 $argv                     ; end
function psag   ; ps aux | grep $argv               ; end
function u      ; cd ..                             ; end
function uu     ; cd ../..                          ; end
function uuu    ; cd ../../..                       ; end
function uuuu   ; cd ../../../..                    ; end
function uuuuu  ; cd ../../../../..                 ; end
function uuuuuu ; cd ../../../../../..              ; end

function tarx   ; tar xzvf $argv                    ; end
function tarc   ; tar czvf $argv[1].tar.gz $argv[1] ; end

function ff     ; find . | grep $argv               ; end

if mac
  function ls ; gls --color=auto -Fh $argv ; end
else 
  function ls ;  ls --color=auto -Fh $argv ; end
end


##### bundler ########################################
function bi      ; bundle install                  ; end
function bo      ; bundle open $argv               ; end
function bu      ; bundle update $argv             ; end
function bs      ; bundle show $argv               ; end
function be      ; bundle exec $argv               ; end
function ber     ; bundle exec rails $argv         ; end
function beg     ; bundle exec guard $argv         ; end
function befs    ; bundle exec foreman start $argv ; end

function bers
  if bundle exec rails --version | grep "Rails 2" > /dev/null 2>&1
    bundle exec script/server $argv
  else
    bundle exec rails server $argv
  end
end

function bert
  bundle exec thin start
end

function berc
  if bundle exec rails --version | grep "Rails 2" > /dev/null 2>&1
    bundle exec script/console $argv
  else
    bundle exec rails console $argv
  end
end
function burke ; berc ; end

function trt     ; touch tmp/restart.txt      ; end
function rR      ; rake routes                ; end
function rRg     ; rake routes | grep $argv   ; end
function berspec ; bundle exec rspec -c $argv ; end

function rlc     ; tail -f log/development.log | grep "Processing by" ; end
function rlv     ; tail -f log/development.log | grep "Rendered"      ; end
function rli     ; tail -f log/development.log | grep "INFO"          ; end


function prRg
  rRg $argv | ruby -e 'while (line = gets); line.gsub!(/^\s*/, ""); line.gsub!(/\s+*/. "\n/"); line.gsub!(/\s*\{/. "\n{"); line += "\n"; puts line; end'
end


##### git ############################################

function glol ; lol --graph -200 $argv ; end
function lol
  set HASH "%C(yellow)%h%Creset"
  set RELATIVE_TIME "%Cgreen(%ar)%Creset"
  set AUTHOR "%C(blue)<%an>%Creset"
  set REFS "%C(red)%d%Creset"
  set SUBJECT "%s"

  set FORMAT "$HASH}$RELATIVE_TIME}$AUTHOR}$REFS $SUBJECT"

  git log -1000 --pretty="tformat:$FORMAT" $argv | sed -Ee 's/(^[^<]*) ago)/\1)/' | sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?)/\1)/' | column -s '}' -t | less -FXRS
end


function grim  ; git rebase -i master          ; end
function gri   ; git rebase -i $argv           ; end
function grih  ; git rebase -i HEAD~$argv      ; end
function gm    ; git merge $argv               ; end
function gmm   ; git merge master              ; end
function gam   ; git commit --amend -m "$argv" ; end

function gpl   ; git pull $argv                ; end
function gps   ; git push $argv                ; end
function gst   ; git status $argv              ; end
function gco   ; git checkout $argv            ; end
function gcob  ; git checkout -b $argv         ; end
function gcom  ; git checkout master           ; end
function ga    ; git add $argv                 ; end
function ga.   ; git add .                     ; end
function grm   ; git remote $argv              ; end
function gc    ; git commit $argv              ; end
function gcm   ; git commit -m $argv           ; end
function gdf   ; git diff --color $argv        ; end
function gdl   ; gdf HEAD~1 HEAD               ; end
function gdn   ; gdf HEAD~$argv[1] HEAD        ; end
function gcp   ; git cherry-pick $argv         ; end
function grs   ; git reset $argv               ; end
function grsh  ; git reset --hard $argv        ; end
function gbd   ; git branch -D $argv           ; end
function gbdr  ; git push origin :$argv        ; end
function gpu   ; git pull upstream $argv       ; end
function gpum  ; git pull upstream master      ; end

# pull new branch from upstream
function gbu
  git fetch upstream
  git checkout upstream/$argv[1]
  git checkout -b $argv[1]
  git push origin $argv[1]
end

function ghg   ; open https://github.com/$argv ; end
function ghge  ; ghg eqdw/$argv                ; end
function ghgs  ; ghg coupa/coupa_development   ; end

##### Vagrant #####################
function vssh
  vagrant ssh
end


##### Marking and Jumping ##########
function mark
  ln -s (pwd) ~/.jump/$argv[1]
end
function unmark
  rm ~/.jump/$argv[1]
end
function jump
  cd ~/.jump/$argv[1]
end



##### Utilities ####################
function r ; ruby $argv            ; end
function e ; vim $argv 2>/dev/null ; end

function chx ; chmod +x $argv ; end

function less ; /usr/bin/less -FXRS $argv ; end


if mac
  eval (gdircolors -b ~/.LS_COLORS | grep -v export | sed 's/LS_COLORS=/set -x LS_COLORS /')
else
  eval (dircolors -b ~/.LS_COLORS | grep -v export | sed 's/LS_COLORS=/set -x LS_COLORS /')
end


##### RBENV ###########
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH

set -gx RBENV_ROOT $HOME/.rbenv

. (rbenv init -|psub)

rbenv rehash >/dev/null ^&1
##### END RBENV #######

##### Eval local terminal customizations
. ~/.fishrc.local
