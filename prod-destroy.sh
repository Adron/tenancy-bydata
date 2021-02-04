cd terraform

terraform destroy \
  -var 'server="UnionStation"' \
  -var 'username='$PUN'' \
  -var 'password='$PWORD'' \
  -var 'database="Control"' \
  -var 'apiport=8080'
