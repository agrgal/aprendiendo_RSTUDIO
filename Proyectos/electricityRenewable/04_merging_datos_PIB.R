# Intenta conseguir el nombre del país según el código
RESULTADO=merge(datos,PIB)
RESULTADO=merge(RESULTADO,ENERGIA)
# ordeno algo las columnas
RESULTADO=RESULTADO[c("nombrePais","Codigos","Anno","ratio","PIB","ENERGIA")]

# creando relación
RESULTADO$RENOVABLE=round(RESULTADO$ENERGIA*RESULTADO$ratio/100,2)
