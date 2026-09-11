FROM alpine:latest@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

WORKDIR /app/

COPY ./aks-node-termination-handler /app/aks-node-termination-handler

RUN apk upgrade \
&& addgroup -g 30523 -S app \
&& adduser -u 30523 -D -S -G app app

USER 30523

ENTRYPOINT [ "/app/aks-node-termination-handler" ]