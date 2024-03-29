#!/bin/bash

set -x

#Para ejecutar el escript lo aremos como superusuario para evitar que nos pida contraseñas
#Actualizacion de Repositorios

apt-get update

#Instalamos apache 2

apt-get install apache2 -y

#Instalamos las librerias de apache para MYSQL

apt-get install php libapache2-mod-php php-mysql -y 

#Instalamos git para poder trabajar

apt-get install git -y

#Instalamos las debconf-utils

#apt-get install debconf-utils -y

cd /var/www/html

# Descargar la ultima version de wordpress

wget https://es.wordpress.org/latest-es_ES.tar.gz

# Descomprimimos el rar

tar -xzvf latest-es_ES.tar.gz 

#Cambiamos el propietario del repositorio

chown www-data:www-data * -R

#Entramos en la carpeta de wordpress 

cd wordpress

#Cambiamos el nombre del archivo que se ve en primer lugar por el segundo.

mv wp-config-sample.php wp-config.php

#Introducimos las siguientes entradas en el archivo de configuracion wp-config.php para sustituirlas por las existentes.

sed -i 's/'database_name_here'/'wp_db'/' wp-config.php

sed -i 's/'username_here'/'wp_user'/' wp-config.php

sed -i 's/'password_here'/'wp_user'/' wp-config.php

sed -i 's/'localhost'/'52.91.57.43'/' wp-config.php

#Damos permisos de lectura al fichero de configuracion.

chmod +x wp-config.php 

#Introducir las siguientes lineas.

echo "define( 'WP_SITEURL', 'http://3.86.112.221/wordpress' );" >> wp-config.php

echo "define( 'WP_HOME', 'http://3.86.112.221' );" >> wp-config.php

#movemos el index.php a la carpeta html lo cambiamos a un directorio que no es la raiz

cp /var/www/html/worpress/index.php ../

# a continuacion reempleazamos el contenido del index.php que esta fuera

sed -i 's#wp-blog-header.php#/wordpress/wp-blog-header.php#' /var/www/html/index.php

cd /home/ubuntu

rm -rf archivo-conf-balanceador

git clone https://github.com/manueljesus1995/archivo-conf-balanceador.git

mv /archivo-conf-balanceador/htaccess /var/www/html/.htaccess


systemctl restart apache2

