wcld() {wc -l $1/**/* 2>/dev/null | sort -nr | head -n10}

function web {
  scp -r $1 eqdw.net:~/website
  echo "http://eqdw.net/$1" | pbcopy
}
