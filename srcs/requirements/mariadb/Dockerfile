FROM debian:bookworm

RUN apt-get -y update
RUN apt-get -y install mariadb-server

COPY --chmod=755 ./tools/script.sh /

EXPOSE 3306

ENTRYPOINT ["/script.sh"]
