FROM docker.io/library/golang:1.16-bullseye as builder

RUN apt-get update && apt-get -y install libfuse-dev

WORKDIR /root

RUN git clone https://github.com/kahing/goofys.git && \
    cd goofys && \
    git checkout 08534b28a2195d30bb3c45dce0b834f3696028b8

RUN cd goofys && go build -ldflags "-X main.Version=`git rev-parse HEAD`"

###

FROM debian:bullseye

LABEL org.opencontainers.image.source https://github.com/danielsig727/dockerfiles

RUN apt-get update && apt-get install -y fuse ca-certificates openssl syslog-ng coreutils

COPY --from=builder /root/goofys/goofys /usr/local/bin

COPY syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
COPY run.sh /root
WORKDIR /root

ENTRYPOINT [ "/root/run.sh" ]
