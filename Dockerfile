FROM ubuntu:22.04 AS ubuntu
WORKDIR /app
RUN mkdir /app/bedrock_server && \
    apt update && \
    apt install -y curl unzip && \
    curl -sLO https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.22.01.zip && \
    unzip bedrock-server-1.21.22.01.zip -d /app/bedrock_server


FROM alpine:latest

COPY --from=ubuntu --chown=root:root --chmod=755 /lib/*-linux-gnu/* /usr/local/lib/
WORKDIR /lib64
RUN ln -s /usr/local/lib/ld-linux-*.so.2 /lib64/

COPY --from=ubuntu /app/bedrock_server /app/bedrock_server
VOLUME [ "/app/bedrock_server" ]

EXPOSE 19132/udp

WORKDIR /app/bedrock_server
ENV LD_LIBRARY_PATH="/usr/local/lib"
CMD ["./bedrock_server"]
