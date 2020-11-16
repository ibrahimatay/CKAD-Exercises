sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf install docker-ce --nobest -y

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

sudo docker pull portainer/portainer

sudo docker run -d -p 9000:9000 --name your_portainer_name --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer

sudo firewall-cmd --permanent --zone=trusted --change-interface=docker0
sudo firewall-cmd --permanent --zone=trusted --add-port=4243/tcp
sudo firewall-cmd --reload

sudo docker swarm leave
sudo docker swarm join

docker swarm join-token worker # https://docs.docker.com/engine/swarm/join-nodes/

sudo docker stack deploy --compose-file=agent-stack.yml portainer-agent 
