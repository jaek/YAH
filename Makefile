<<<<<<< HEAD
test: test.go
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
	docker run -itd alpine
=======
DOCKER=docker

all:
	go test
	$(DOCKER) build -t yah .

run:
	$(DOCKER) run -d -p 2222:2222 --name="yah" yah

stop:
	$(DOCKER) stop yah; $(DOCKER) rm yah
>>>>>>> bafff3a2d1d638e3ca7fff23777cd799572b8d71
