// 1. Guarda la consulta base de humedad
data = from(bucket: "clima_bucket")
  |> range(start: -24h)
  |> filter(fn: (r) => r["_measurement"] == "clima_sensores")
  |> filter(fn: (r) => r["_field"] == "humedad")

// 2. Calcula el valor máximo por día (24h)
maximos = data 
  |> aggregateWindow(every: 24h, fn: max, createEmpty: false)
  |> map(fn: (r) => ({ r with tipo_pico: "maximo" }))

// 3. Calcula el valor mínimo por día (24h)
minimos = data 
  |> aggregateWindow(every: 24h, fn: min, createEmpty: false)
  |> map(fn: (r) => ({ r with tipo_pico: "minimo" }))

// 4. Une ambos resultados ciudad/sensor
union(tables: [maximos, minimos])
  |> group(columns: ["_measurement", "_field", "ciudad", "sensor_id", "tipo_pico"])
  |> yield(name: "picos_humedad")
  