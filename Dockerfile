FROM lowyard/gossip-dev:latest
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y net-tools 
WORKDIR /go/src
RUN echo 004
#RUN git clone -v https://github.com/humstarman/core.git
ADD deps/core core/
WORKDIR /workspace 
ADD src/main.go /workspace/
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/agent agent.go
#ADD src/member.go /workspace/
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/member member.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/main .
CMD ["/usr/local/bin/main"]
#CMD ["tail","-f","/dev/null"]
