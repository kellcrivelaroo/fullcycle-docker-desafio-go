FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod init desafio-go

RUN go build -o main .

#multi-stage build
FROM scratch

COPY --from=builder /app/main /

CMD ["/main"]
