import time
import random
from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS

# CONFIGURACIÓN DE LA CUENTA EN LA NUBE
TOKEN = "idxa-WlUitjMPD85cExemUMFEOtHGSQaZz-BX6WpnFgDJkJ9rRSeE4itmWfRs1LLOyJkeN6lLUfEB2u_ils0hg==" 
ORG = "65f2216be0d2cfc9"     # Este es tu ID de organización que vi en tu URL
BUCKET = "clima_bucket"
URL = "https://us-east-1-1.aws.cloud2.influxdata.com"

client = InfluxDBClient(url=URL, token=TOKEN, org=ORG)
write_api = client.write_api(write_options=SYNCHRONOUS)

config_ciudades = {
    "Lima": {"t_med": 22.0, "h_med": 80.0},
    "Cusco": {"t_med": 12.0, "h_med": 45.0},
    "Iquitos": {"t_med": 31.0, "h_med": 85.0}
}

print("Enviando datos climáticos a InfluxDB Cloud... Presiona Ctrl+C para detener.")
try:
    while True:
        for ciudad, params in config_ciudades.items():
            temp = round(params["t_med"] + random.uniform(-2.0, 2.0), 2)
            hum = round(min(100.0, max(0.0, params["h_med"] + random.uniform(-5.0, 5.0))), 2)
            
            point = Point("clima_sensores") \
                .tag("ciudad", ciudad) \
                .tag("sensor_id", f"{ciudad[:3].upper()}-01") \
                .field("temperatura", temp) \
                .field("humedad", hum)
            
            write_api.write(bucket=BUCKET, org=ORG, record=point)
        time.sleep(2)  # Envía datos cada 2 segundos
except KeyboardInterrupt:
    print("\nSimulación pausada.")
finally:
    client.close()