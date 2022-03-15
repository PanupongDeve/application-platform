# step for generate cert

- host > docker exec -it <kong-container> bash
- kong-container > mkdir /etc/kong/cert
- kong-container > cd /etc/kong/cert
- kong-container > kong hybrid gen_cert
- host > docker cp /etc/kong/cert .
- host mv cert ./api-gateway/kong