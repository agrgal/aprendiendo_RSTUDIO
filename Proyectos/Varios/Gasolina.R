# Descargando los datos
Precios= read.csv("~/R/GPP-CFP_ESP.csv")

# Precios mínimo, máximo y medio de la gasolina
minGas=min(Precios$Gasolina)
maxGas=max(Precios$Gasolina)
medioGas=round(mean(Precios$Gasolina),3)
paste0("El precio mínimo de la gasolina fue de "
       ,minGas
       ," el máximo de "
       ,maxGas
       ," y el precio medio de "
       ,medioGas)

# Precios mínimo, máximo y medio del diesel
minDie=min(Precios$Diesel)
maxDie=max(Precios$Diesel)
medioDie=round(mean(Precios$Diesel),3)
paste0("El precio mínimo del diesel fue de "
       ,minDie
       ," el máximo de "
       ,maxDie
       ," y el precio medio de "
       ,medioDie)

# Subdataframe preGasUnoConDos
preGasUnoConDos=Precios[Precios$Gasolina>=1.2, c("Fecha","Gasolina")]

# Días en los que la gasolina obtuvo un precio alto.
diasGasPrecioAlto=ordered(preGasUnoConDos$Fecha)
diasGasPrecioAlto
paste0("Ha habido ",
       length(diasGasPrecioAlto),
       " días con precios dela gasolina iguales o superiores a 1.2€")

# Dibujo del histograma
# library("latticeExtra")
# library("tidyr")
# Reordeno y arreglo el DATAFRAME, como uno 
# con dos factores y un valor. Lo necesita cloud
# Precios2=Precios%>%gather(tipo,valor,Gasolina,Diesel)
# Me aseguro tipo ocmo factor
# Precios2$tipo=as.factor(Precios2$tipo)
Precios2=Precios[seq(1,length(Precios$Fecha),5),1:3]
Precios3=as.matrix(Precios2[2:3])
rownames(Precios3)=Precios2$Fecha
barplot(t(Precios3)
        ,col=c("lightblue","darkblue")
        ,beside=TRUE
        ,ylim=c(0,1.6)
        ,las=2,cex.axis=1,cex.names = 0.5
        ,yaxp=c(0,1.5,15)
        ,main="Evolución Precios Gasolina-Diesel"
        ,xlab="Fechas",ylab="Precios por litro (€)"
        ,legend.text = c("Gasolina","Diesel")
        ,args.legend = list(x=70,y=1.5,cex=1.2,horiz=TRUE)
        )

# Diferencia
Precios$diferencia=Precios$Gasolina-Precios$Diesel

# Fechas en las que la diferencia fue máxima
fechasMaxima = Precios[Precios$diferencia==as.character(max(Precios$diferencia)),]$Fecha
length(fechasMaxima)
fechasMaxima

# Fechas en las que la diferencia fue mínima
fechasMinima = Precios[Precios$diferencia==as.character(min(Precios$diferencia)),]$Fecha
length(fechasMinima)
fechasMinima