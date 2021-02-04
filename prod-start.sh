cd terraform

terraform apply -auto-approve \
  -var 'server=logisticscoresystemsdb' \
  -var 'username='$PUN'' \
  -var 'password='$PWORD'' \
  -var 'database=logistics' \
  -var 'apiport=8080'
