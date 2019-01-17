FROM golang:latest
RUN apt-get update
RUN apt-get install -y git-core 
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
WORKDIR /go/src
RUN git clone https://github.com/hashicorp/memberlist.git
WORKDIR /go/src/memberlist
RUN sed -i s?"go get -t -d -v ./..."?"-@go get -t -d -v ./..."?g Makefile
RUN sed -i s?"echo \$(DEPS) | xargs -n1 go get -d"?"-@echo \$(DEPS) | xargs -n1 go get -d"? Makefile
RUN make deps
