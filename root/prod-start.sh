terraform init

terraform apply -auto-approve \
  -var 'server=unionstation' \
  -var 'username='$DBUN'' \
  -var 'password='$DBPW'' \
  -var 'database=control' \
  -var 'apiport=8080'
