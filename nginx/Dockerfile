FROM alpine:latest

LABEL maintainer "Peerasan Buranasanti <peerasan@gmail.com>"

# Stable Repo
RUN apk upgrade -U && apk --no-cache add \
	supervisor tzdata nginx \
	cp -r /etc/nginx /etc/nginx.orig && \
	cp -r /etc/supervisord.conf /etc/supervisord.conf.orig
  
COPY fs /

# ensure www-data user exists
# 82 is the standard uid/gid for "www-data" in Alpine
RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1 \
  mkdir -p /apps; chown -Rf www-data:www-data /apps


#CLEAN
RUN mkdir -p /apps; \
	mkdir -p /var/run/php; \
	mkdir -p /var/log/php7; \
	chown -Rf nginx:nginx /apps

RUN rm /var/cache/apk/*;

EXPOSE 80

ADD run.sh /root/run.sh
CMD /bin/sh /root/run.sh
