#!/bin/bash

#host=$1
#Antes de ejecutar esto ejecute la siguiente instruccion en el sistema operativo:
#chown -R $USER:$USER /usr/bin/wg
#chown -R $USER:$USER /usr/bin/wg-quick

#para crear el cron debe ejecutar crontab -e
#en el crontab escriba * * * * * para que se ejecute cada minuto y la ruta completa de su sh

#no se olvide de editar el archivo </etc/pam.d/sudo> agregando <auth sufficient pam_permit.so> para que no le pida permiso de sudo


host="20.0.0.1"
function pingcheck
{
	ping=`ping -c 1 -t 2 $host | grep time | wc -l`
	if [ "$ping" -gt 1 ];then
		echo "UP"
	else
		echo "Reconectando..."
		wg-quick down wg0
		wg-quick up wg0
		echo "Reconectado."
		exit
	fi
}

pingcheck