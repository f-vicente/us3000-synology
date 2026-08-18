FROM alpine:3.24

RUN apk add --no-cache \
        nut \
        libusb \
        dumb-init \
    && ln -s "$(readlink -f /usr/lib/libusb-1.0.so.0)" /usr/lib/libusb-1.0.so.0.5.0 \
    && mkdir -p /var/run/nut /etc/nut

COPY nut /etc/nut
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3493

LABEL maintainer="franfj@gmail.com"
LABEL description="NUT (Network UPS Tools) Docker container for Ugreen US3000 UPS on Synology"

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/start.sh"]
