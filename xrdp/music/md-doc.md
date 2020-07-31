time docker build -t ubuntu-18-04-xrdp-original-music .

docker run --rm -it --privileged -p 3389:3389 -u $(id -u):$(id -g) -e USER=aine -e PASSWD=aine_pwd -v $HOME/script-sketch/xrdp/music/container:/home/aine ubuntu-18-04-xrdp-original-music
