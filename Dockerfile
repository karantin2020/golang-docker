FROM        golang:1.8.3-alpine3.6 as builder

RUN         cp /usr/local/go/bin/* /go/bin

FROM        alpine:3.6
RUN         mkdir -p /go
WORKDIR     /go
COPY        --from=builder /go/ ./
RUN         export GOROOT="/go"; \
            export PATH="/go/bin:$PATH"; \
            go version
