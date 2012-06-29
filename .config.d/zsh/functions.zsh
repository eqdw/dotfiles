wcld() {wc -l $1/**/* 2>/dev/null | sort -nr | head -n10}

function web {
  scp -r $1 eqdw.net:~/website
  echo "http://eqdw.net/$1" | pbcopy
}

# reload database named $1 with sql in file $2
function reload_db {
  #save old db
  mysqldump  -u root -p $1 > $1.sql
  mysqladmin -f -u root -p drop $1
  mysqladmin -u root -p create $1
  mysql -u root -p $1 < $2
}

