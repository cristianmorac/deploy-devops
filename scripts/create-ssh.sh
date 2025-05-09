#!/bin/bash

SSH_KEY="$HOME/.ssh/id_rsa"

# 1. Crear par de claves si no existe
if [ ! -f "$SSH_KEY" ]; then
    echo "🔑 Generando clave SSH..."
    ssh-keygen -t rsa
else
    echo "✅ Clave SSH ya existe en $SSH_KEY"
fi

# Ejecutar binario ssh
/usr/sbin/sshd
