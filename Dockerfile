FROM        golang:1.8.3-alpine3.6 as builder

RUN         cp -af /usr/local/go/bin/* /go/bin; \
            cp -af /usr/local/go /usr/local

FROM        alpine:3.6
RUN         mkdir -p /go; \
            mkdir -p /home/go
ENV         GOPATH /go

WORKDIR     $GOPATH
COPY        --from=builder /go/ ./
RUN         chmod -R 777 "$GOPATH"; \
            export GOROOT="/home/go"; \
            export PATH="/go/bin:$PATH"; \
            go version

ENV         GOROOT /usr/local/go
ENV         PATH $GOPATH/bin:$PATH
