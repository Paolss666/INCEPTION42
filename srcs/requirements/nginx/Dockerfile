FROM debian:bullseye

# MIJ et installation pack necessari
RUN apt-get update -y 
RUN apt-get install -y nginx 
RUN apt-get install -y vim 
RUN apt-get install -y curl
# creation dossier pour certficat ssl
# SSL (Secure Sockets Layer) => protocol que on l'utilise pour 
# connecter en maniere crypte le cliet (ex browser web ) et un server(web site)
# protection les data echage etre eux 

# Quando vedi un lucchetto accanto all'URL nella barra degli indirizzi del tuo browser e l'URL inizia con "https", significa che il sito sta utilizzando SSL/TLS per proteggere la tua connessione.

RUN mkdir -p /etc/nginx/ssl
# SSL utils pour gerer certificat e cle crypografique
RUN apt-get install -y openssl
 
# Gener un certifact utilise par openssl dans le dossier que on viens de creer
# -x509 genere le certificat x509 
# -nodes permet de pas cifrer la cle private
# -out specifie le parcour d'output 
# -keyout specifie le parcoursde la cle private 
# -subj definie les champs du certificat (pays, etat, organization etc)
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=npaolett.42.fr/UID=npaolett"
RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# donne e droit du directory qui contien les files utilise 
# par nginx 
RUN chmod 755 /var/www/html
# change le proprietaire et le group du directory html
# et le contenu
RUN chown -R www-data:www-data /var/www/html


# Docker container are design to run a sigle foreground proces. if the ain processin a Docker containe exits, thecontaineritself will stop.
# CMD --> comande when the conainter start finche nginx e' in esecuzione.When nginxin the background(daemonmode), the foreground process terinates, causing the cotainer to exit event thoughtNgingis still runnign in the background.
# Si usa questa oanda per tenere il container acceso fino a quando nginx e' attivo
CMD ["nginx", "-g", "daemon off;"]
