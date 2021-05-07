# STEP 1 - Build da aplicação

FROM golang:1.16.4-alpine3.13 as builder

WORKDIR /go/src/app
COPY . .
RUN go build ./app.go

# STEP 2 - Executar aplicação

FROM scratch
COPY --from=builder /go/src/app .
CMD ["./app"]
