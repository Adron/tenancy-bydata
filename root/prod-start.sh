terraform init

terraform apply -auto-approve \
  -var 'server=unionstation' \
  -var 'username='$DBUN'' \
  -var 'password='$DBPW'' \
  -var 'database=control' \
  -var 'apiport=8080'

arbitures mutate hasurafig \
  -u $(terraform output hasura_uri_path) \
  -p "./hasura/config.yaml"

# Note: The README.md has more details about the arbitures CLI.