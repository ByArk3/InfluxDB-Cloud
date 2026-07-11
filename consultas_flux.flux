Monitoreo de Temperatura en Tiempo Real

from(bucket: "clima_bucket")
  |> range(start: -1h)
  |> filter(fn: (r) => r["_measurement"] == "clima_sensores")
  |> filter(fn: (r) => r["_field"] == "temperatura")
  |> group(columns: ["ciudad"])

Agregación Temporal y Promedios Horarios

from(bucket: "clima_bucket")
  |> range(start: -1h)
  |> filter(fn: (r) => r["_measurement"] == "clima_sensores")
  |> filter(fn: (r) => r["_field"] == "temperatura")
  |> group(columns: ["ciudad"])
  |> aggregateWindow(every: 1h, fn: mean, createEmpty: false)