FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get  update -y
RUN apt-get install apache2 -y
RUN apt-get install libapache2-mod-php php -y
#COPY index.php /var/www/html/
RUN apt-get install libaio1 libaio-dev
RUN apt-get update -y
RUN apt-get install mysql-server -y
RUN usermod -d /var/lib/mysql/ mysql
RUN apt-get install net-tools unzip -y
RUN apt-get install curl wget -y
RUN wget https://www.exploit-db.com/apps/604788a0877e4ffdb0451142cb8b955c-rconfig-3.9.4.zip
RUN cp 604788a0877e4ffdb0451142cb8b955c-rconfig-3.9.4.zip  /var/www/html
RUN unzip /var/www/html/604788a0877e4ffdb0451142cb8b955c-rconfig-3.9.4.zip

EXPOSE 80
EXPOSE 3306
COPY apache apache
COPY mysql mysql
COPY start_service.sh start_service.sh

CMD ./start_service.sh



