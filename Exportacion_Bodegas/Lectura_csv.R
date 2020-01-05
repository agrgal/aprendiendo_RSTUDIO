# 1) Apertura de los datos 
exportacion <- read.csv("Exportacion_Bodegas/datos_exportacion.csv")

# 2) análisis
str(exportacion)


#3) Conversion Calidad
levels(exportacion$Calidad)=c("","A","B","B","E","E","M","M","R","R")
levels(exportacion$Calidad)=c("","Aceptable","Buena","Excelente","Mala","Regular")
levels(exportacion$Calidad)

#4) Conversión Cantidad
levels(exportacion$Cantidad)=c("","A","A","B","B","E","E","S","S")
levels(exportacion$Cantidad)=c("","Abundante","Buena","Escasa","Suficiente")
levels(exportacion$Cantidad)

#5) Ordenados
exportacion$Calidad=ordered(exportacion$Calidad,levels=c("","Mala","Regular","Aceptable","Buena","Excelente"))
exportacion$Cantidad=ordered(exportacion$Cantidad,levels=c("","Escasa","Suficiente","Buena","Abundante"))
str(exportacion)

#6) Escribo datos a nuevo csv
write.csv(exportacion,"Exportacion_Bodegas/datos_exportados_convertidos.csv",row.names = FALSE)