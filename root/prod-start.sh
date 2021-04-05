# Note: The README.md has more details about the arbitures CLI.

if [ $DBUN != "" ] && [ $DBPW != "" ] ; then

  terraform init

  terraform apply -auto-approve \
    -var 'server=unionstation' \
    -var 'username='$DBUN'' \
    -var 'password='$DBPW'' \
    -var 'database=control' \
    -var 'apiport=8080'

  URIPATH=`echo $(terraform output hasura_uri_path) | tr -d '"'`
  $URIPATH > current_hasura_uri_path.txt

  cd hasura

  hasura migrate apply --database-name default --admin-secret $DBPW --endpoint $URIPATH

  # Note: The metadata file, is currently a manually exported metadata file located in the metadata directory.
  # If further updates to the migrations are made this will make the metadata out of sync and another export will
  # need to be made. Currently the hasura metadata export command could suffice, but it currently doesn't work.
  hasura metadata apply --from-file --admin-secret $DBPW --endpoint $URIPATH

  hasura console --admin-secret $DBPW --endpoint $URIPATH

else

  echo "Set the value for DBUN environment variable, it is currently undefined."

fi
