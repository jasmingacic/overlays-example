FROM golang:1.18

WORKDIR /example
COPY . .

RUN go build -o example

CMD ["./example"]