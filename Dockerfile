FROM golang:latest
RUN apt-get update
RUN apt-get install -y git-core 
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
WORKDIR /workspace
RUN git clone https://github.com/hashicorp/memberlist.git
WORKDIR /workspace/memberlist
RUN make deps
