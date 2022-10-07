#!/bin/bash

#####Esto hicimos para no perder el ping en la colping cuando usamos wireguard

#host=$1
#Antes de ejecutar esto ejecute la siguiente instruccion en el sistema operativo:
#chown -R $USER:$USER /usr/bin/wg
#chown -R $USER:$USER /usr/bin/wg-quick

#para crear el cron debe ejecutar crontab -e
#en el crontab escriba * * * * * para que se ejecute cada minuto y la ruta completa de su sh

#no se olvide de editar el archivo </etc/pam.d/sudo> agregando <auth       sufficient   pam_permit.so> para que no le pida permiso de sudo


#host="20.0.0.1"
#function pingcheck
#{
#	ping=`ping -c 1 -t 2 $host | grep time | wc -l`
#	if [ "$ping" -gt 1 ];then
#		echo "UP"
#	else
#		echo "Reconectando..."
#		wg-quick down wg0
#		wg-quick up wg0
#		echo "Reconectado."
#		exit
#	fi
#}

#pingcheck


#############Esto es para backup################
# primero instalar el cliente de postgres 
# >sudo apt-get install postgresql-client
# crear un directorio de backups /u01/backups

curl -X POST --data-urlencode "payload={\"channel\": \"#backups\", \"username\": \"Servisofts SRL\", \"text\": \"Iniciando el backup\", \"icon_url\": \"https://servisofts.com/img/servisofts.png\"}" https://hooks.slack.com/services/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


pg_dump -U postgres -h 192.168.5.37 -p 5432 servisofts.CasaGrande > /u01/backups/$(date +"%Y%m%d%H%M%S")_CasaGrande.sql


curl -X POST --data-urlencode "payload={\"channel\": \"#backups\", \"username\": \"Servisofts SRL\", \"text\": \"Backup exitoso :smile:\", \"icon_url\": \"https://servisofts.com/img/servisofts.png\"}" https://hooks.slack.com/services/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

