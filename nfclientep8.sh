#!/bin/bash

set -x

#Instalación de paquetes necesarios en el cliente NFS:

apt-get update
apt-get install nfs-common -y

#Creamos el punto de montaje en el cliente 

mount 52.91.77.158:/var/www/html/wordpress/wp-content /var/www/html/wordpress/wp-content

#Añadimos la siguiente linea en el archivo /etc/fstab

echo "52.91.77.158:/var/www/html/wordpress/wp-content /var/www/html/wordpress/wp-content  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab

#Reiniciamos el servicio nfs

/etc/init.d/nfs-common restart
