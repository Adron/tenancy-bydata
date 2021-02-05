terraform init

terraform apply -auto-approve \
  -var 'server='$server'' \
  -var 'username='$username'' \
  -var 'password='$password'' \
  -var 'database='$database'' \
  -var 'apiport=8080'