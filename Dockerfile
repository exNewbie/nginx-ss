FROM nginx:latest AS build

ARG cert_age=365

WORKDIR /root

COPY ./openssl.conf /root/openssl.conf

RUN openssl rand -writerand /var/lib/randfile && \
    openssl req -x509 -nodes -days ${cert_age} -newkey rsa:2048 -keyout ss.key -out ss.crt -config /root/openssl.conf

######################################################################################################################

FROM nginx:latest

COPY --from=build /root/ss.key /etc/ssl/private/ss.key

COPY --from=build /root/ss.crt /etc/ssl/certs/ss.crt

