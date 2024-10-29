
FROM golang:1.23-alpine
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN GOOS=linux GOARCH=amd64 go build -o ./out/dist .
EXPOSE 8080
CMD ["./out/dist"]