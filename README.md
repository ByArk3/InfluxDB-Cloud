# Sistema de Monitoreo y Simulación Climática con InfluxDB Cloud
Este repositorio contiene el prototipo completo de un sistema de telemetría para el monitoreo de variables climáticas en tiempo real de tres regiones del Perú (Lima, Cusco e Iquitos). El sistema genera datos simulados de sensores, los transporta a la nube y permite realizar análisis analíticos avanzados.

# Estructura de Archivos del Proyecto
* clima-nosql-influxdb/
* ├── simulador_clima.py   # Script de Python con la lógica y conexión al SDK
* ├── consultas_flux.flux  # Archivo de texto con las consultas analíticas del informe
* └── README.md            # Archivo de documentación técnica

# Requisitos de Software 
Para replicar o ejecutar este proyecto, necesitas tener instaladas las siguientes herramientas en el entorno local:

# 1. Entorno de Desarrollo y Lenguaje
**Python (Versión 3.10 o superior):** Lenguaje base utilizado para construir el script de automatización y simulación de datos de hardware.
**Visual Studio Code (VS Code):** Editor de código fuente utilizado para la programación, depuración y ejecución del ecosistema local.

# 2. Extensiones Obligatorias para VS Code
**Python (by Microsoft):** Para el soporte de sintaxis, autocompletado y ejecución del código.
**Flux (by InfluxData):**  Añade resaltado de sintaxis y soporte para el desarrollo de scripts de consulta Flux dentro del editor.

# 3. Librerías y SDKs de Python
instala la librería oficial de conexión ejecutando:
```bash
pip install influxdb-client
```
# Parámetros de Conexión Cloud

El almacenamiento se realiza en un clúster Serverless de InfluxDB Cloud alojado en AWS (us-east-1). Los parámetros obligatorios de conectividad configurados en el código son:

* **URL del Servidor:** https://us-east-1-1.aws.cloud2.influxdata.com
* **Organization ID (Org):** 65f2216be0d2cfc9
* **Bucket de Destino:** clima_bucket
* **Token de Autenticación:** PRIVADO

# Ejecutar en consola
```bash
simulador_clima.py
```
El script comenzará a enviar ráfagas de datos en tiempo real de Lima, Cusco e Iquitos cada 2 segundos. Donde se vera los mensajes de confirmación impresos en la consola.