#terraform init

#terraform apply -auto-approve \
#  -var 'server=unionstation' \
#  -var 'username='$DBUN'' \
#  -var 'password='$DBPW'' \
#  -var 'database=control' \
#  -var 'apiport=8080'

# This gets the variable, then removes the quotes from the variable, then prefixes the result
# with https://.
APIPATH=$(terraform output hasura_uri_path)
APIPATH=$(sed -e 's/^"//' -e 's/"$//' <<<"$APIPATH")
APIPATH="https://$APIPATH"

# Chang the directory into the hasura directory to make the config.yaml file change.
cd hasura

# Concatenate the string for the sed command to remove the localhost and add the new URI.
PRE="sed 's+http://localhost:8080+"
POST="+g' config.yaml"
SEDIT="$PRE$APIPATH$POST"
eval $SEDIT
