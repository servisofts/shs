#!/bin/bash

# primero instalar el cliente de postgres 
# >sudo apt-get install postgresql-client
# crear un directorio de backups /u01/backups


nombre=$(date +"%Y%m%d%H%M%S")_Calistenia.sql

curl -X POST -H 'Content-type: application/json' --data '{
  "channel": "CBR2V3XEX",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "<https://calistenia.servisofts.com|*Iniciando Backup de Calistenia*>"
      },
      "accessory": {
        "type": "image",
        "image_url": "https://calisteniabolivia.com/images/sucursal_ff7f8192-ff66-4e97-8a8e-23daefe57743?date=1665122501208",
        "alt_text": "Calistenia"
      }
    }
  ]
}' https://hooks.slack.com/services/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

mkdir /u01/backups/calistenia

pg_dump -U postgres -h 192.168.5.18 -p 5432 servisofts.calistenia > /u01/backups/calistenia/$nombre


curl -X POST -H 'Content-type: application/json' --data '{
  "channel": "CBR2V3XEX",
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "Finalizando el backup de Calistenia \n Archivo creado '$nombre'"
      }
    }
  ]
}' https://hooks.slack.com/services/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