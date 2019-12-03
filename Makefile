DOCKER=docker

all:
	go test
	$(DOCKER) build -t yah .

run:
	$(DOCKER) run -d -p 2222:2222 --name="yah" yah

stop:
	$(DOCKER) stop yah; $(DOCKER) rm yah

