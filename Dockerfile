FROM debian:buster-slim AS debian

RUN apt-get update -y

RUN apt-get install -y wbritish-insane

FROM alpine:latest

COPY --from=debian /usr/share/dict/words /usr/share/dict/words

COPY ./potential-urls /

ENTRYPOINT ["/potential-urls"]

