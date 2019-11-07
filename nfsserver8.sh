#Instalación de paquetes necesarios en el servidor NFS:

apt-get update
apt-get install nfs-kernel-server

#Cambiamos los permisos al directorio que vamos a compartir:

sudo chown nobody:nogroup /var/www/html/wp-content

#Añadimos la siguiente línea al archivo exports

sed '/var/www/html/wp-content      35.153.207.97(rw,sync,no_root_squash,no_subtree_check)' /etc/exports

#Reiniciamos el servicio nfs

sudo /etc/init.d/nfs-kernel-server restart



