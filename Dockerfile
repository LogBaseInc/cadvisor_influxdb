FROM golang:wheezy
MAINTAINER karthikv2k@gmail.com

RUN go get github.com/tools/godep
RUN go get -d github.com/google/cadvisor
RUN cd src/github.com/google/cadvisor/ && \ 
	godep go build -a github.com/google/cadvisor && \
	cp cadvisor /usr/bin/cadvisor
EXPOSE 8080

ENTRYPOINT /usr/bin/cadvisor $RUN_OPTS