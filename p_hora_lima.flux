from(bucket: "clima_bucket")

// Datos de la última 1 hora
  |> range(start: -1h)
  |> filter(fn: (r) => r["_measurement"] == "clima_sensores")
  |> filter(fn: (r) => r["_field"] == "temperatura")
  |> filter(fn: (r) => r["ciudad"] == "Lima") 

  // Promedio (mean) por hora 
  |> aggregateWindow(every: 1h, fn: mean, createEmpty: false)
  