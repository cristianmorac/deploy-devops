#!/bin/bash

# Archivo de inventario
INVENTARIO="$HOME/proy-devops/ansible/inventory.ini"
USUARIO="root"

if [ ! -f "$INVENTARIO" ]; then
  echo "❌ El archivo '$INVENTARIO' no existe. Abortando..."
  exit 1
fi

# Extraer todas las IPs
IPS=$(grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$INVENTARIO")

# Verifica que tengas una clave pública
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  echo "🔐 No se encontró clave pública. Generando..."
  ssh-keygen -t rsa
fi

# Enviar clave pública a cada IP
for ip in $IPS; do
  echo "➡️ Enviando clave a $USUARIO@$ip..."
  ssh-copy-id -o StrictHostKeyChecking=no "$USUARIO@$ip"
done

echo "✅ Clave pública enviada a todos los servidores."
