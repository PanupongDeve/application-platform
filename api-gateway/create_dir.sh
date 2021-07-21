USER=$(id -u)
mkdir pg_data
chown $USER:$USER pg_data
mkdir pgadmin
sudo chown 5050:5050 pgadmin