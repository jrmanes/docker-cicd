FROM golang:1.18.3 as builder
LABEL maintainer="Jose Ramon Mañes - github.com/jrmanes/docker-cicd"
ADD . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

######## Start a new stage from scratch #######
FROM alpine:latest
COPY --from=builder /app/main .

# Command to run the executable
CMD ["./main"]
