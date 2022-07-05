default: 

# Create a library
create libName:
  mkdir -p libraries/{{libName}}/{steps,src,resources,test}
# LIB={{libName}} envsubst < resources/docs/README.template.md > libraries/{{libName}}/README.md

build jenkins:
  docker build -t jenkins:lts-docker  jenkins

launch jenkins:
  docker rm -f jenkins
  docker volume create local_jenkins
  docker run --name jenkins \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v local_jenkins:/var/jenkins_home \
    --privileged \
    --user root \
    -p 50000:50000 \
    -p 8080:8080 \
    -d \
    jenkins:lts-docker
  docker logs -f jenkins