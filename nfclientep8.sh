#Instalación de paquetes necesarios en el cliente NFS:

apt-get update
apt-get install nfs-common

#Creamos el punto de montaje en el cliente 

mount 3.90.39.15:/var/www/html/wp-content /var/www/html/wp-content

#Añadimos la siguiente linea en el archivo /etc/fstab

echo "52.146.223.45:/var/www/html/wp-content /var/www/html/wp-content  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab

#Reiniciamos el servicio nfs

/etc/init.d/nfs-common restart
