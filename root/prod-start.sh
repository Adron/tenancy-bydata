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
  URIFULLPATH="http://$URIPATH"
  echo $URIFULLPATH > current_hasura_uri_path.txt

  cd hasura

  hasura migrate apply --database-name default --admin-secret $DBPW --endpoint $URIFULLPATH

  hasura metadata apply --admin-secret $DBPW --endpoint $URIFULLPATH

  hasura console --admin-secret $DBPW --endpoint $URIFULLPATH

else

  echo "Set the value for DBUN environment variable, it is currently undefined."

fi
