FROM golang:buster AS builder

WORKDIR /build
COPY . .
RUN go build ./...


FROM debian:buster-slim AS runner
COPY --from=builder /build/k8s-hostdev-plugin /usr/local/bin/
ENTRYPOINT ["k8s-hostdev-plugin"]
