# most of this file thanks to github.com/burke

function fish_prompt ; /Users/eqdw/src/wunderprompt-fish/prompt $status ; end

set fish_greeting ""

set -x RUBY_HEAP_MIN_SLOTS 1000000
set -x RUBY_HEAP_SLOTS_INCREMENT 1000000
set -x RUBY_HEAP_SLOTS_GROWTH_FACTOR 1
set -x RUBY_GC_MALLOC_LIMIT 1000000000
set -x RUBY_HEAP_FREE_MIN 500000

function mac   ; test (uname -s) = "Darwin" ; end
function linux ; test (uname -s) = "Linux"  ; end


set -x EDITOR vim
set -x NAME Tim Herd
set -x EMAIL rz@eqdw.net

set -x PAGER less
set -x GIT

set -x GIT_AUTHOR_NAME $NAME
set -x GIT_COMMITTER_NAME $NAME
set -x GIT_AUTHOR_EMAIL $EMAIL
set -x GIT_COMMITTER_EMAIL $EMAIL
set -x RUBYOPT "rubygems"
set -x PATH /usr/local/bin $PATH



##### MISC #####
function def ; ack "def $argv" ; end

function bergm ; e (bundle exec rails generate migration $argv[1] | tail -n1 | awk '{print $3}') ; end
function elm   ; e db/migrate/(ls db/migrate | tail -n1) ; end

function cpip
  set ip (ifconfig en0 | grep inet | awk '{print $2}' | tail -n1)
  echo $ip | pbcopy
  echo $ip
end

function pyserv
  echo http://(ifconfig en0 | grep inet | awk '{print $2}' | tail -n1):8000 | pbcop
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


if mac
  function ls ; gls --color=auto -Fh $argv ; end
else 
  function ls ;  ls --color=auto -Fh $argv ; end
end

##### bundler ########################################
function bi      ; bundle install             ; end
function bo      ; bundle open $argv          ; end
function bu      ; bundle update $argv        ; end
function bs      ; bundle show $argv          ; end
function be      ; bundle exec $argv          ; end
function ber     ; bundle exec rails $argv    ; end
function burke   ; bundle exec rails console  ; end

function trt     ; touch tmp/restart.txt      ; end
function rR      ; rake routes                ; end
function rRg     ; rake routes | grep $argv   ; end
function berspec ; bundle exec rspec -c $argv ; end

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
function gam   ; git commit --amend -m "$argv" ; end

function gpl   ; git pull $argv                ; end
function gps   ; git push $argv                ; end
function gst   ; git status $argv              ; end
function gco   ; git checkout $argv            ; end
function ga    ; git add $argv                 ; end
function ga.   ; git add .                     ; end
function grm   ; git remote $argv              ; end
function gc    ; git commit $argv              ; end
function gcm   ; git commit -m $argv           ; end
function gdf   ; git diff --color $argv        ; end
function gcp   ; git cherry-pick $argv         ; end
function grs   ; git reset $argv               ; end
function grsh  ; git reset --hard $argv        ; end

function ghg   ; open https://github.com/$argv ; end
function ghge  ; ghg eqdw/$argv                ; end
function ghgs  ; ghg coupa/coupa_development   ; end



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


##### Eval local terminal customizations
. ~/.fishrc.local
