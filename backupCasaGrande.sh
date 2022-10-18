#!/bin/bash

# primero instalar el cliente de postgres 
# >sudo apt-get install postgresql-client
# crear un directorio de backups /u01/backups


nombre=$(date +"%Y%m%d%H%M%S")_CasaGrande.sql

curl -X POST -H 'Content-type: application/json' --data '{
  "channel": "CBR2V3XEX",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "<https://casagrande.servisofts.com|*Iniciando Backup de Casa Grande*>"
      },
      "accessory": {
        "type": "image",
        "image_url": "http://www.w3.org/2000/svg",
        "alt_text": "Casa Grande"
      }
    }
  ]
}' https://hooks.slack.com/services/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

mkdir /u01/backups/casagrande/

pg_dump -U postgres -h 192.168.5.37 -p 5432 servisofts.CasaGrande > /u01/backups/casagrande/$nombre


curl -X POST -H 'Content-type: application/json' --data '{
  "channel": "CBR2V3XEX",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "Finalizando el backup de Casa Grande \n Archivo creado '$nombre'"
      }
    }
  ]
}' https://hooks.slack.com/services/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