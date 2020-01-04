# Establece la carpeta de trabajo
setwd("~/R/Leccion_6_ejercicio_P2P")

# Carga el paquete dplyr, para filtrar, ordenar data.frames
library("dplyr", lib.loc="~/R/i686-pc-linux-gnu-library/3.2")

# Introduce en la variable data frame Resultados los datos.
Resultados <- read.csv("~/R/Leccion_6_ejercicio_P2P/Halterofilia.csv", sep=";")

# -----------------------------------------------------------------------------
# Cuestión a: "Categoria" como factor ordenado en orden creciente de sus pesos. 
# El proceso intenta automatizar la creación del factor ordenado, primero orde-
# nando por el peso y, a dos pesos iguales, primero por la palabra "menos" y 
# después por la palabra "más"
# -----------------------------------------------------------------------------
Categoria = Resultados$Categoria  # obtengo la columna de las Categorías
levelsCategoria=levels(Categoria) # obtengo los distintos niveles

# produce una lista con parejas de valores mas - menos, y peso, separando por el espacio
levelsCategoriaLista=strsplit(levelsCategoria," ") 

# unlist convierte la lista en un vector simple. La salida se formatea como matriz, y las parejas 
# V1 - V2 contienen el modificador "mas" o "menos" (V1) y el peso (V2)
levelsCategoriaMatriz=matrix(unlist(levelsCategoriaLista),nrow=14,byrow=TRUE)

# Convierte la matriz en una Data frame
levelsCategoriaData = data.frame(levelsCategoriaMatriz)

# renombra las columnas del data frame
names(levelsCategoriaData)=c("masmenos","peso")

# Convierte los valores a números
# TRUCO: para que entienda bien los números he leído que ANTES
# debemos asegurarnos que están como caracteres
levelsCategoriaData$peso=as.numeric(as.character(levelsCategoriaData$peso))

# Ordena el data frame por peso, y si hay dos pesos iguales primero por "menos" 
# y después por "más"
levelsCategoriaData=arrange(levelsCategoriaData,peso,desc(masmenos))

# Redefine el vector levelsCategoria, uniendo las dos columnas del data frame
levelsCategoria = paste(levelsCategoriaData$masmenos,levelsCategoriaData$peso,sep=" ")

# Por último, ordena el factor Categoria de Resultados según el 
# nuevo vector levelsCategoria
Resultados$Categoria = ordered(Resultados$Categoria,levels=levelsCategoria)

# presenta resultados
levels(Resultados$Categoria)
str(Resultados)

# -----------------------------------------------------------------------------
# Cuestión b: Crear una tabla (dibujarla en MARKDOWN) en la que para
# cada combinación de categoría y sexo se de el peso medio en arrancada 
# y dos tiempos. Usar la función aggregate
# -----------------------------------------------------------------------------
# Calculo un data frame con los resultados de la cuestión B
B = aggregate(cbind(Arrancada,Dos.Tiempos)~Categoria+Sexo,FUN=mean,data=Resultados,na.rm=TRUE)
# Al presentar la tabla en Markdown, generar un round ¿¿??

# -----------------------------------------------------------------------------
# Cuestión c: Dataframes ResM y ResF (hombres y mujeres)
# Tienen que tener dos columnas: peso y total.
# -----------------------------------------------------------------------------
ResM = Resultados[Resultados$Sexo=="M",c("Peso","Total")]
ResF = Resultados[Resultados$Sexo=="F",c("Peso","Total")]

# -----------------------------------------------------------------------------
# Cuestión d: gráfica de ResM, con el peso corporal en X y
# peso total en Y. Triángulos vacíos de color rojo.
# -----------------------------------------------------------------------------
plot(ResM$Peso,ResM$Total,main="Peso Total levantado vs Peso Corporal", xlab="Peso Corporal (Kg)",xlim=c(40,170),ylim=c(100,500),ylab="Peso Total levantado (kg)", pch=2,col="red",cex=0.8,xaxp=c(50,180,26))

# Explicación: en el límite de cada Categoría Masculina: menos 56, menos 62, hasta 
# menos 105, se observa una acumulación de registros. Esto indica que los atletas
# intentan controlar su peso y ajustarlo al máximo dentro de su categoría. A partir
# de 105Kg la categoría es única, y la distribución es más regular. Parece observarse
# cierta proporcionalidad: a más peso corporal, mayor peso total levantado.

# Añado explicación a la gráfica.
limitesMasculinos=c(56,62,69,77,85,94,105)
abline(v=limitesMasculinos,col="orange",lwd=2,lty="dotted")
text(limitesMasculinos,470,labels=paste(limitesMasculinos,"Kg",sep=""),cex=0.8,pos=c(3,1))

# -----------------------------------------------------------------------------
# Cuestión e: añadir al gráfico los resultados femeninos
# cuadrados de color verde, añadir una leyenda.
# -----------------------------------------------------------------------------
# Parto de la gráfica masculina de nuevo: reestructuro los límites
xmin=floor(min(Resultados$Peso))-1
xmax=ceiling(max(Resultados$Peso))+1
ymin=floor(min(Resultados$Total))-1
ymax=ceiling(max(Resultados$Total))+1
plot(ResM$Peso,ResM$Total,main="Peso Total levantado vs Peso Corporal", xlab="Peso Corporal (Kg)",xlim=c(xmin,xmax),ylim=c(ymin,ymax),ylab="Peso Total levantado (kg)", pch=2,col="red",cex=0.8,xaxp=c(xmin,xmax,trunc(0.5*(xmax-xmin))))
# dibujo la femenina, añadiendo puntos de color verde
points(ResF$Peso,ResF$Total,pch=22,col="green",bg="green")
legend("bottomright",legend=c("Masculino","Femenino"),pch=c(2,22),col=c("red","green"),pt.bg=c("red","green"))

# -----------------------------------------------------------------------------
# Cuestión f1: análisis de regresión lineal femenino
# -----------------------------------------------------------------------------
xmin=floor(min(ResF$Peso))-1
xmax=ceiling(max(ResF$Peso))+1
ymin=floor(min(ResF$Total))-1
ymax=ceiling(max(ResF$Total))+1
plot(ResF$Peso,ResF$Total,main="Peso Total levantado vs Peso Corporal (Femenino)", xlab="Peso Corporal (Kg)",xlim=c(xmin,xmax),ylim=c(ymin,ymax),ylab="Peso Total levantado (kg)", pch=22,col="green",bg="green",cex=0.8,xaxp=c(xmin,xmax,trunc(0.5*(xmax-xmin))))
# regresión lineal
funLinealMujeres = lm(ResF$Total~ResF$Peso)
# abline(funLineal)
coefRegresion = summary(funLinealMujeres)$r.squared
coefRegresion
# regresion semilogarítmica
funSemiLog= lm(log10(ResF$Total)~ResF$Peso)
coefRegSemiLog = summary(funSemiLog)$r.squared
coefRegSemiLog
# regresión doble logarítmica
funDblLog= lm(log10(ResF$Total)~log10(ResF$Peso))
coefRegDblLog = summary(funDblLog)$r.squared
coefRegDblLog
# A tenor de los resultados, al menos para mujeres, el mejor ajuste
# es lineal. Sin embargo su coeficiente R2 (coef. de determinación) 
# es demasiado bajo; no supera el valor de 0.9
# La dispersión de algunos valores para la categoría de más de 75Kg unido a la 
# acumulación de resultados en categorías inferiores, da como resultado 
# ese bajo coeficiente de determinación

# El valor de la pendiente de la recta y = ax +b, de mejor ajuste, representa
# el valor de aumento en y (peso levantado) por cada aumento en x (peso corporal)
abline(funLinealMujeres,col="green4",lty="dashed",lwd=2)
aMujeres = round(funLinealMujeres$coefficients[2],2)
bMujeres = round(funLinealMujeres$coefficients[1],2)
textofila1=paste("Coef. Determinación función lineal",expression(R^2),"=",round(coefRegresion,2))
textofila2=paste("Por cada Kg de peso corporal se levanta",aMujeres,"Kg")
textofila3=paste("Recta de regresión: y=",aMujeres,"x +",bMujeres)
text(80,140,labels=textofila1,cex=0.8,pos=4)
text(80,120,labels=textofila2,cex=0.8,pos=4)
text(80,100,labels=textofila3,cex=0.8,pos=4)


# -----------------------------------------------------------------------------
# Cuestión f2: análisis de regresión lineal masculino
# -----------------------------------------------------------------------------
xmin=floor(min(ResM$Peso))-1
xmax=ceiling(max(ResM$Peso))+1
ymin=floor(min(ResM$Total))-1
ymax=ceiling(max(ResM$Total))+1
plot(ResM$Peso,ResM$Total,main="Peso Total levantado vs Peso Corporal (Masculino)", xlab="Peso Corporal (Kg)",xlim=c(xmin,xmax),ylim=c(ymin,ymax),ylab="Peso Total levantado (kg)", pch=2,col="red",cex=0.8,xaxp=c(xmin,xmax,floor(xmax-xmin)))
# regresión lineal
funLineal = lm(ResM$Total~ResM$Peso)
# abline(funLineal)
coefRegresion = summary(funLineal)$r.squared
coefRegresion
# regresion semilogarítmica
funSemiLog= lm(log10(ResM$Total)~ResM$Peso)
coefRegSemiLog = summary(funSemiLog)$r.squared
coefRegSemiLog
# regresión doble logarítmica
funDblLogHombres= lm(log10(ResM$Total)~log10(ResM$Peso))
coefRegDblLogHombres = summary(funDblLogHombres)$r.squared
coefRegDblLogHombres
# A tenor de los resultados, al menos para mujeres, el mejor ajuste
# es doble logarítmico con R2 = 0.5854 a muy poca diferencia del 
# ajuste lineal con R2=0.5834; ambos, por debajo de los valores de 0.9
# Por lo tanto, no muy buenos.

# El valor de la pendiente de la recta log(y) = alog(x) +b, 
# se corresponde con la función potencial y=beta*x^a
# con beta = 10^b
aHombres = round(funDblLogHombres$coefficients[2],2)
bHombres = round(funDblLogHombres$coefficients[1],2)
betaHombres = 10^bHombres
curve(betaHombres*(x^aHombres),xlim=c(xmin,xmax),add=TRUE,lwd=2,lty="dashed",col="red4")
textofila1=paste("Coef. Determinación función doble log.",expression(R^2),"=",round(coefRegDblLogHombres,2))
# textofila2=paste("Por cada Kg de peso corporal se levanta",aMujeres,"Kg")
# Por cada kg de peso corporal añadido, el peso que puede levantarse varía
# según la relación y2/y1 = (1+1/x)^a
textofila2=paste("Recta de regresión: log(y)=",aHombres,"log(x) +",bHombres)
textofila3=paste("Función potencial: ","y=",round(betaHombres,2),"* x ^",aHombres)
text(100,200,labels=textofila1,cex=0.8,pos=4)
text(100,180,labels=textofila2,cex=0.8,pos=4)
text(100,160,labels=textofila3,cex=0.8,pos=4)

# -----------------------------------------------------------------------------
# Cuestión g: Gráficas con las rectas correspondientes
# -----------------------------------------------------------------------------
# Parto de la gráfica masculina de nuevo: reestructuro los límites
xmin=floor(min(Resultados$Peso))-1
xmax=ceiling(max(Resultados$Peso))+1
ymin=floor(min(Resultados$Total))-1
ymax=ceiling(max(Resultados$Total))+1
plot(ResM$Peso,ResM$Total,main="Peso Total levantado vs Peso Corporal", xlab="Peso Corporal (Kg)",xlim=c(xmin,xmax),ylim=c(ymin,ymax),ylab="Peso Total levantado (kg)", pch=2,col="red",cex=0.8,xaxp=c(xmin,xmax,trunc(0.5*(xmax-xmin))))
# dibujo la femenina, añadiendo puntos de color verde
points(ResF$Peso,ResF$Total,pch=22,col="green",bg="green")
legend("bottomright",legend=c("Masculino","Femenino"),pch=c(2,22),col=c("red","green"),pt.bg=c("red","green"))
# añado las rectas de regresión. Primero la femenina
# abline(funLinealMujeres,col="green4",lty="dashed",lwd=2,xlim=c(xmin,xmax))
curve(aMujeres*x+bMujeres,xlim=c(xmin,xmax),add=TRUE,lwd=2,lty="dashed",col="green4")
# Después la curva de regresión doble logarítmica masculina
curve(betaHombres*(x^aHombres),xlim=c(xmin,xmax),add=TRUE,lwd=2,lty="dashed",col="red4")

# -----------------------------------------------------------------------------
# Cuestión h - añadida -: Regresión con el resumen de las medias por Categorías
# -----------------------------------------------------------------------------
ResMCat = Resultados[Resultados$Sexo=="M",c("Peso","Total","Categoria")]
ResFCat = Resultados[Resultados$Sexo=="F",c("Peso","Total","Categoria")]
MascPorCat = aggregate(ResMCat$Total~ResMCat$Categoria,data=ResMCat,FUN=mean)
FemPorCat = aggregate(ResFCat$Total~ResFCat$Categoria,data=ResFCat,FUN=mean)
# cambio el nombre de las columnas
names(MascPorCat)=c("Cat","Total")
names(FemPorCat)=c("Cat","Total")
# -----------------------
# Dibujo para las mujeres
# -----------------------
FemPorCat
antiguo.par=par()
par(mar=c(4,4,4,4),cex=1,mfrow=c(1,1))
plot(FemPorCat$Total,pch=2,col="green",axes=FALSE,ann=FALSE,ylab="Peso Total Medio",main="Peso Total medio vs Categorías",ylim=c(160,250))
n=1:nrow(FemPorCat)
axis(1,at=n,labels=FemPorCat$Cat,cex=0.5,las=2)
axis(2,las=1,at=round(FemPorCat$Total,1))
box()
title(main="Pesos Totales Medios vs Categorías - Femenino -",ylab="Peso Total Medio (Kg)")
FemPorCatLinea = lm(FemPorCat$Total~n)
abline(FemPorCatLinea,lwd=2,lty="dotted",col="green4")
coeficienteFemPorCatLinea =summary(FemPorCatLinea)$r.squared
a = round(FemPorCatLinea$coefficients[2],2)
b = round(FemPorCatLinea$coefficients[1],2)
textofila1=paste("Coef. Determinación función lineal",expression(R^2),"=",round(coeficienteFemPorCatLinea,2))
textofila2=paste("Recta de regresión: y=",a,"x +",b)
text(3,180,labels=textofila1,cex=0.8,pos=4)
text(3,170,labels=textofila2,cex=0.8,pos=4)

# -----------------------
# Dibujo para los hombres
# -----------------------
plot(MascPorCat$Total,pch=2,col="red",axes=FALSE,ann=FALSE,ylab="Peso Total Medio",main="Peso Total medio vs Categorías")
n=1:nrow(MascPorCat)
axis(1,at=n,labels=MascPorCat$Cat,cex=0.5,las=2)
axis(2,las=1,at=round(MascPorCat$Total,1))
box()
title(main="Pesos Totales Medios vs Categorías - Masculino -",ylab="Peso Total Medio (Kg)")
MascPorCatLinea = lm(MascPorCat$Total~n)
abline(MascPorCatLinea,lwd=2,lty="dotted",col="red4")
coeficienteMascPorCatLinea =summary(MascPorCatLinea)$r.squared
a = round(MascPorCatLinea$coefficients[2],2)
b = round(MascPorCatLinea$coefficients[1],2)
textofila1=paste("Coef. Determinación función lineal",expression(R^2),"=",round(coeficienteMascPorCatLinea,2))
textofila2=paste("Recta de regresión: y=",a,"x +",b)
text(4,280,labels=textofila1,cex=0.8,pos=4)
text(4,270,labels=textofila2,cex=0.8,pos=4)
par = antiguo.par
