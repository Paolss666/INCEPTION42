FROM debian:bullseye

RUN apt-get update -y 
RUN apt-get install -y nginx 
RUN apt-get install -y vim 
RUN apt-get install -y curl
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
 

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=npaolett.42.fr/UID=npaolett"
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html


# Docker container are design to run a sigle foreground proces. if the ain processin a Docker containe exits, thecontaineritself will stop.
# CMD --> comande when the conainter start finche nginx e' in esecuzione.When nginxin the background(daemonmode), the foreground process terinates, causing the cotainer to exit event thoughtNgingis still runnign in the background.
# Si usa questa oanda per tenere il container acceso fino a quando nginx e' attivo
CMD ["nginx", "-g", "daemon off;"]
