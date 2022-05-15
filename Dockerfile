FROM golang:1.18.2 as build

WORKDIR /src

COPY . .
RUN go build ./app.go

FROM scratch

WORKDIR /src

COPY --from=build /src/app ./

CMD ["/src/app"]