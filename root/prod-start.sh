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

  hasura migrate apply --database-name default

  # Note: The metadata file, is currently a manually exported metadata file located in the metadata directory.
  # If further updates to the migrations are made this will make the metadata out of sync and another export will
  # need to be made. Currently the hasura metadata export command could suffice, but it currently doesn't work.
  hasura metadata apply --from-file

  hasura console

else

  echo "Set the value for DBUN environment variable, it is currently undefined."

fi
