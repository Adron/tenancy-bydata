# Note: The README.md has more details about the arbitures CLI.

if [ $DBUN != "" ] && [ $DBPW != "" ] ; then

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

  cd hasura

  hasura migrate apply

  hasura console

else

  echo "Set the value for DBUN environment variable, it is currently undefined."

fi
