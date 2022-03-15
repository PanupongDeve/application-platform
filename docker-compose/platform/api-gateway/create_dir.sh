USER=$(id -u)
mkdir pg_data
chown $USER:$USER pg_data
mkdir konga_data
chown $USER:$USER konga_data
mkdir pgadmin
sudo chown 5050:5050 pgadmin