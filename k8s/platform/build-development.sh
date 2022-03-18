# bin/bash

# --------------------------- build data -------------------------------
echo "building database......."
helm template mysql -f ./database/mysql/mysql-template/values-development.yaml  ./database/mysql/mysql-template/ > ./database/mysql/mysql-development/application.yaml

echo "build finish............."
