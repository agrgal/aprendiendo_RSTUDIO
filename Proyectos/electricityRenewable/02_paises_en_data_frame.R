# Intenta conseguir el nombre del país según el código
datos$Codigos=factor(datos$Codigos) # los códigos de los países en datos
codigos=datos$Codigos
listadoPaises <- read.csv("~/R/electricityRenewable/paises.csv")
# nombre de paises
library(dplyr)
# Utilizar %in% con filter para filtrar los datos
# Creo un data frame, a partir del listado de países, con 
# dos columnas, una con el nombre del país, y otra con el código
nombrePaises=filter(listadoPaises,Código%in%codigos)[,c("nombre","Código")]
# Ordenando este vector por código
nombrePaises=nombrePaises[order(nombrePaises$Código),]
nombrePaises
# Crear datos2 como filtrado con los Códigos de países
datos2=filter(datos,Codigos%in%listadoPaises$Código)
datos2$nombrePais=nombrePaises$nombre # asigno el nombre de los paises
# Reacondiciono datos
# rm(codigos)
# ordenar datos con tidyr. 
# Ver "https://blog.rstudio.org/2014/07/22/introducing-tidyr/"
library("tidyr")
datos2=datos2%>%gather(Anno,ratio,1:11)
datos2$Anno=as.factor(gsub("X","",datos2$Anno))
datos=datos2
rm(datos2)
rm(nombrePaises)



