FROM debian:bookworm

RUN apt-get -y update
RUN apt-get -y install php-fpm php-mysql wget

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY --chmod=755 ./tools/script.sh /

EXPOSE 9000

CMD ["/script.sh"]
