FROM odoo:18.0

USER root

# 1. Instalamos dependencias de sistema (Añadido pkg-config y libxmlsec1-dev)
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    libjpeg-dev \
    zlib1g-dev \
    pkg-config \
    libxmlsec1-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Instalamos librerías Python con la bandera --break-system-packages
# Esto es obligatorio en Odoo 18 / Debian 12
RUN pip3 install --no-cache-dir --break-system-packages \
    pandas \
    openpyxl \
    xlrd \
    unicodecsv \
    unidecode \
    num2words \
    pyopenssl \
    xmlsig \
    paramiko \
    python-slugify

USER odoo