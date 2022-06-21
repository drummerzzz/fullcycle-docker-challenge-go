FROM golang:alpine as builder

WORKDIR /app

COPY . /app

RUN go build main.go

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT ["./app/main"]