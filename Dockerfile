FROM golang:latest

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o hello-workflow ./worker ./starter 

EXPOSE 3030

CMD ["./hello-workflow"]