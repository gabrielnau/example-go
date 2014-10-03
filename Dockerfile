FROM deis/go:latest

ADD . /go/src/github.com/deis/example-go
RUN CGO_ENABLED=0 go get -a -ldflags '-s' github.com/deis/example-go
