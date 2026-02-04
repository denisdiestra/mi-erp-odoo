# Odoo 18 Community + OCA (Dockerized)

Implementación local de Odoo 18 Community Edition potenciado con módulos de la OCA (Odoo Community Association), desplegado sobre Docker.

## 📋 Requisitos Previos

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado y corriendo.
* Git instalado.

## 🚀 Instalación y Despliegue

Sigue estos pasos para levantar el proyecto desde cero en una máquina nueva:

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/TU_USUARIO/mi-erp-odoo.git](https://github.com/TU_USUARIO/mi-erp-odoo.git)
    cd mi-erp-odoo
    ```

2.  **Descargar módulos de la OCA:**
    Los módulos comunitarios no se guardan en este repo para ahorrar espacio. Debes descargarlos con el script incluido:
    ```bash
    cd oca
    bash download_repos.sh
    cd ..
    ```

3.  **Construir y Levantar:**
    Este paso descargará las imágenes de Docker, instalará las dependencias de Python y levantará el servidor.
    ```bash
    docker-compose up -d --build
    ```

4.  **Acceder:**
    * URL: http://localhost:8069
    * **Master Password:** `admin` (Definido en `config/odoo.conf`)

## 📂 Estructura del Proyecto

* `/addons`: Módulos personalizados desarrollados por nosotros.
* `/oca`: Módulos de la comunidad (descargados vía script).
* `/config`: Archivo de configuración `odoo.conf`.
* `Dockerfile`: Imagen personalizada con librerías extra (pandas, xmlsec, etc.).
* `docker-compose.yml`: Orquestación de contenedores (Web + DB).

## 🛠 Comandos Útiles

* **Ver logs en tiempo real:**
    ```bash
    docker-compose logs -f
    ```
* **Reiniciar Odoo (sin borrar datos):**
    ```bash
    docker-compose restart web
    ```
* **Apagar todo:**
    ```bash
    docker-compose down
    ```

## 📝 Notas de Desarrollo
* Para instalar nuevos módulos OCA, agrégalos al script `oca/download_repos.sh`, ejecútalo y luego agrégalos al `addons_path` en `config/odoo.conf`.
* Recuerda activar el "Modo Desarrollador" en Odoo para ver las opciones técnicas.
