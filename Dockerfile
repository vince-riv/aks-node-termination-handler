FROM alpine:latest@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a

WORKDIR /app/

COPY ./aks-node-termination-handler /app/aks-node-termination-handler

RUN apk upgrade \
&& addgroup -g 30523 -S app \
&& adduser -u 30523 -D -S -G app app

USER 30523

ENTRYPOINT [ "/app/aks-node-termination-handler" ]