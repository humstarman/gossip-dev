FROM lowyard/golang-dev:latest
WORKDIR /go/src
#RUN git clone -v -b dev https://github.com/humstarman/core.git
RUN echo 0388
ADD deps/core core/
WORKDIR /go/src/core
WORKDIR /workspace 
ADD src/main.go /workspace/
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/agent agent.go
#ADD src/member.go /workspace/
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/member member.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/main .
CMD ["/usr/local/bin/main"]
#CMD ["tail","-f","/dev/null"]
