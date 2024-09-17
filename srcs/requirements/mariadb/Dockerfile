FROM debian:bullseye

# install MariaDB and other dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
RUN apt-get install -y procps


# copy the provided config file to the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 770 /var/lib/mysql/

# expose dans la porte 3306 -> port standard aveec qui mariadb axcept le connection
# et permet de connecter le container avec un autre service
EXPOSE 3306

COPY ./tools/dbscript.sh ./
RUN chmod +x ./dbscript.sh

# specific la commande que doit etre execute quand le container 
# start -> dans ce cas quand le container est execute il vas a eseguir lo script dans bash
ENTRYPOINT ["bash", "./dbscript.sh"]