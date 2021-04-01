docker-compose up -d

terraform init

sleep 1

terraform apply -auto-approve \
  -var 'server=localhost' \
  -var 'username='postgres'' \
  -var 'password='postgrespassword'' \
  -var 'database=control'

cd ../hasura

hasura migrate apply

hasura console --admin-secret myadminsecretkey