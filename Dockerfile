# Build starter image
FROM golang:alpine as starter

WORKDIR /app/starter

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o hello-starter ./src/starter 

EXPOSE 3030

CMD ["./hello-starter"]

# Build worker image
FROM golang:alpine as worker

WORKDIR /app/worker

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o hello-worker ./src/worker

EXPOSE 2020

CMD ["./hello-worker"]


# Package final images
# FROM alpine:latest as final
# COPY --from=worker /app/worker /app/worker/
# COPY --from=starter /app/starter /app/starter/


# EXPOSE 3030
# EXPOSE 2020

# CMD ["./hello-starter"]


