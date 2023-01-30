FROM golang:alpine as starter

WORKDIR /app/starter

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o hello-starter ./src/starter 

FROM golang:alpine as worker

WORKDIR /app/worker

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o hello-worker ./src/worker

FROM alpine:latest as final
COPY --from=worker /src/worker /app/worker/
COPY --from=starter /src/starter /app/starter/


EXPOSE 3030



EXPOSE 2020

CMD ["./hello-worker", "./hello-worker"]

