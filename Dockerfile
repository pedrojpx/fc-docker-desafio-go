#Build stage
FROM golang:1.21-alpine3.19 as buildStage

WORKDIR /usr/src/build

COPY hello.go .

RUN go build ./hello.go

#Actual application
FROM scratch

WORKDIR /usr/src/app

COPY --from=buildStage /usr/src/build/hello .

ENTRYPOINT ["./hello"]