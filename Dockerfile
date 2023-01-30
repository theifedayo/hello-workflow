FROM golang:latest

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o hello-workflow ./worker
RUN go build -o hello-workflow ./starter 

EXPOSE 3030

CMD ["./hello-workflow"]