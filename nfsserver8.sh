#!/bin/bash

set -x

#Instalación de paquetes necesarios en el servidor NFS:

apt-get update
apt-get install nfs-kernel-server -y

#Cambiamos los permisos al directorio que vamos a compartir:

chown nobody:nogroup /var/www/html/wordpress/wp-content

#Añadimos la siguiente línea al archivo exports

echo "/var/www/html/wordpress/wp-content      35.153.207.97(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

#Reiniciamos el servicio nfs

/etc/init.d/nfs-kernel-server restart
