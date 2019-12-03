FROM alpine
WORKDIR /usr/src/app
EXPOSE 2222
COPY main .
CMD ["./main"]

