terraform destroy -auto-approve  \
  -var 'server="unionstation"' \
  -var 'username='$PUN'' \
  -var 'password='$PPW'' \
  -var 'database="control"' \
  -var 'apiport=8080'

terraform destroy -auto-approve  \
  -var 'server="unionstation"' \
  -var 'username='$PUN'' \
  -var 'password='$PPW'' \
  -var 'database="control"' \
  -var 'apiport=8080'

cd hasura

rm -rf config.yaml
cp config-backup.yaml config.yaml