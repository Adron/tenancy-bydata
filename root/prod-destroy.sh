terraform destroy \
  -var 'server="unionstation"' \
  -var 'username='$PUN'' \
  -var 'password='$PPW'' \
  -var 'database="control"' \
  -var 'apiport=8080'
