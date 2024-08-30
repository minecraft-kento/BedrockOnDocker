FROM ubuntu:22.04 AS ubuntu
WORKDIR /app
RUN apt update && apt install -y curl


FROM alpine:latest

COPY --from=ubuntu --chown=root:root --chmod=755 /lib/*-linux-gnu/* /usr/local/lib/
WORKDIR /lib64
RUN ln -s /usr/local/lib/ld-linux-*.so.2 /lib64/ && \
    apk add --no-cache bash zip && \
    zip -r /tmp/libs.zip /usr/local/lib

EXPOSE 19132/udp

WORKDIR /app/bedrock_server
ENV LD_LIBRARY_PATH="/usr/local/lib"
CMD ["./bedrock_server"]
