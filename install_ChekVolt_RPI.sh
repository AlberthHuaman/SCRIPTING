#!/bin/bash

# Variables
PATH_FOLDER1="/opt/demonCheckHealth_RPI/"
FILE_CHECK="CheckVolt_script.py"
PATH_FOLDER2="/etc/systemd/system/"
FILE_SERVICE="checkhealth.service"
FILE_LOG="checkhealth.log"

# Crear la carpeta & archivos
sudo mkdir /opt/demonCheckHealth_RPI/
sudo touch /var/log/$FILE_LOG
sudo chmod 666 /var/log/$FILE_LOG

# Descargar el archivo 
sudo wget "https://raw.githubusercontent.com/AlberthHuaman/SCRIPTING/main/CheckVolt_script.py" -O $PATH_FOLDER1/$FILE_CHECK && sudo chmod +x $PATH_FOLDER1/$FILE_CHECK
sudo wget "https://raw.githubusercontent.com/AlberthHuaman/SCRIPTING/main/checkhealth.service" -O $PATH_FOLDER2/$FILE_SERVICE && sudo chmod +x $PATH_FOLDER2/$FILE_SERVICE

#Activación de servicio
sudo systemctl enable $FILE_SERVICE
sudo systemctl start $FILE_SERVICE

echo "Script completado con éxito."

#python3 $PATH_FOLDER1/$FILE_CHECK &



