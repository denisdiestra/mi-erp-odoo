#!/bin/bash
# Script para descargar repositorios OCA versión 18.0
BRANCH="18.0"

# Lista de repositorios esenciales
repos=(
    "web"
    "server-tools"
    "server-ux"
    "account-financial-tools"
    "account-financial-reporting"
    "l10n-peru"
    "partner-contact"
    "reporting-engine"
    "social"
)

echo "--- Iniciando descarga OCA Odoo $BRANCH ---"

for repo in "${repos[@]}"
do
    if [ -d "$repo" ]; then
        echo "Actualizando $repo..."
        cd $repo
        git pull origin $BRANCH || echo "⚠️ Error actualizando $repo"
        cd ..
    else
        echo "Clonando $repo..."
        # El flag || true evita que se detenga si la rama 18 no existe
        git clone -b $BRANCH --depth 1 https://github.com/OCA/$repo.git || echo "❌ La rama $BRANCH no existe para $repo aún."
    fi
done