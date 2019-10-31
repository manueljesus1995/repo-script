#!/bin/bash
#Actualizacion de Repositorios

 apt-get update

#Instalamos apache 2

apt-get install apache2 -y

#Instalamos las librerias de apache para MYSQL

apt-get install php libapache2-mod-php php-mysql -y 

#Instalamos git para poder trabajar

apt-get install git -y

#Instalamos las debconf-utils

apt-get install debconf-utils -y

cd /var/www/html

wget https://es.wordpress.org/latest-es_ES.tar.gz

tar -xzvf latest-es_ES.tar.gz 

mv adminer-4.7.3-mysql.php index.php

#Cambiamos el propietario del repositorio

chown www-data:www-data * -R

cd wordpress

mv wp-config-sample.php wp-config.php

sed -i 's/'database_name_here'/'wordpress'/' wp-config.php

sed -i 's/'username_here'/'wordpress'/' wp-config.php

sed -i 's/'password_here'/'word_db'/' wp-config.php

sed -i 's/'localhost'/'34.201.43.198'/' wp-config.php


sudo chmod +x wp-config.php 

echo "define( 'WP_SITEURL', 'http://3.90.138.216' );" >> wp-config.php

echo "define( 'WP_HOME', 'http://3.90.138.216' );" >> wp-config.php

systemctl restart apache2


#Accedemos al directorio y configuramos la base de datos para que busque en la maquina en la que tenemos mysql en lugar de buscar en localhost

sed -i 's/localhost/3.87.227.73/' /var/www/html/iaw-practica-lamp/src/config.php
