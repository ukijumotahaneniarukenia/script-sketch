$ time docker build -t ubuntu-18-04-rdp-test . | tee log

$ docker run -itd --name ubuntu-18-04-rdp-test -p 3389:3389 ubuntu-18-04-rdp
