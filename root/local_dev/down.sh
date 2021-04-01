cd ../hasura

hasura metadata export --admin-secret myadminsecretkey

cd ../local_dev

terraform destroy -auto-approve \
  -var 'server=localhost' \
  -var 'username='postgres'' \
  -var 'password='postgrespassword'' \
  -var 'database=control'

docker-compose down

sleep 1

