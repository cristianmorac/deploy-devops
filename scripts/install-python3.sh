#!/bin/bash

# Actualizar paquetes
apt update
apt upgrade -y

# habilitar el repositorio
add-apt-repository ppa:deadsnakes/ppa -y
apt update

# Validar si esta instalado python
if command -v python3 &> /dev/null
  then
     echo "Instalado python $(python3 --version)"
else
     # Instalar Python 3.11
     apt install python3.12 -y
fi

#  Instalar pip
if command -v pip &> /dev/null
  then
     echo "instalado pip $(pip --version)"
else
    apt install python3-pip -y
fi
