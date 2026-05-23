FROM debian:bookworm

RUN apt-get -y update
RUN apt-get -y install nginx ssl-cert

COPY ./conf/default /etc/nginx/sites-available/
RUN rm -rf /var/www/html/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
