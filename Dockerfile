FROM golang:1.13-alpine3.10

WORKDIR /yah

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main .

EXPOSE 2222

CMD ["./main"]
