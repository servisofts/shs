#!/bin/bash

# primero instalar el cliente de postgres 
# >sudo apt-get install postgresql-client
# crear un directorio de backups /u01/backups

curl -X POST --data-urlencode "payload={\"channel\": \"#backups\", \"username\": \"Servisofts SRL\", \"text\": \"Iniciando el backup\", \"icon_url\": \"https://servisofts.com/img/servisofts.png\"}" https://hooks.slack.com/services/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

nombre=$(date +"%Y%m%d%H%M%S")_CasaGrande.sql

pg_dump -U postgres -h 192.168.5.37 -p 5432 servisofts.CasaGrande > /u01/backups/$nombre

curl -X POST --data-urlencode "payload={\"channel\": \"#backups\", \"username\": \"Servisofts SRL\", \"text\": \"Backup exitoso "" :smile:\", \"icon_url\": \"https://servisofts.com/img/servisofts.png\"}" https://hooks.slack.com/services/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

