test: test.go
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
	docker run -itd alpine
