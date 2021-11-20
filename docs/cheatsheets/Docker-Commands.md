# Docker Commands


|Command                                                                        |Description                              |
|-------------------------------------------------------------------------------|-----------------------------------------|
|docker build -t [Docker Hub Username]/[Image Name]:[Tag] . -f deploy.Dockerfile| Building image with tag                 |
|docker pull [Docker Hub Username]/[Image Name]:[Tag]                           | Sent to image on the docker hub         |
|docker stop $(docker ps -aq)                                                   | Stop all containers                     |
|docker system prune                                                            |  Remove unused images, volumes, images  |
