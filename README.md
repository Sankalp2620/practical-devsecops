# practical-devsecops
practical-devsecops

# After installing Docker
create certificate with below commands
openssl genrsa -aes256 -out ca-key.pem 4096
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem

openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=docker-server" -sha256 -new -key server-key.pem -out server.csr
openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem

-> configure the docker deamon for TLS certificate
-> restart the docker "systemctl restart docker"

# Configure the Docker Swarm for Overlay
docker swarm init
it will give the docker tocken and use it in worker node to join

# create overlay network
docker network create --driver overlay --attachable app-overlay

# Deploy the nginx server using the ngnix image
docker service create --name nginx --network app-overlay --constraint 'node.hostname==node-a' nginx


  
