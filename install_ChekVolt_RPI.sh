#!/bin/bash

# Variables
FILE_ID="tu_id_de_archivo"
FILENAME="nombre_del_archivo.py"
FOLDER_NAME="mi_carpeta"
NEW_FILE="archivo.txt"

# Descargar el archivo desde Google Drive
echo "Descargando archivo desde Google Drive..."
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='$FILE_ID -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$FILE_ID" -O $FILENAME
rm -rf /tmp/cookies.txt
echo "Archivo descargado: $FILENAME"

# Crear la carpeta
echo "Creando la carpeta..."
mkdir -p $FOLDER_NAME
echo "Carpeta creada: $FOLDER_NAME"

# Crear un archivo dentro de la carpeta
echo "Creando el archivo..."
touch $FOLDER_NAME/$NEW_FILE
echo "Archivo creado: $FOLDER_NAME/$NEW_FILE"

# Asignar permisos de ejecución al archivo
echo "Asignando permisos de ejecución..."
chmod +x $FOLDER_NAME/$NEW_FILE
echo "Permisos asignados: $FOLDER_NAME/$NEW_FILE"

echo "Script completado con éxito."
