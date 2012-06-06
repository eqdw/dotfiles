wcld() {wc -l $1/**/* 2>/dev/null | sort -nr | head -n10}

function web {
  scp -r $1 eqdw.net:~/website
  echo "http://eqdw.net/$1" | pbcopy
}

function reload_db {
  mysqladmin -f -u root -p drop $1
  mysqladmin -u root -p create $1
  mysql -u root -p $1 < $2
}

