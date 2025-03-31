FROM alpine:latest
LABEL org.opencontainers.image.source="https://github.com/MetaCubeX/mat"

RUN apk add --no-cache ca-certificates tzdata iptables

VOLUME ["/root/.config/mat/"]

COPY mat-config/ /root/.config/mat/
COPY mat /mat
RUN chmod +x /mat
ENTRYPOINT [ "/mat" ]