cat("\014") # Borrar consola
DFU_G_ultimas8=DFU_G[,5:12] # últimas 8 filas
MCor=round(cor(DFU_G_ultimas8,use="pairwise.complete.obs"),2) # matriz correclaciones
abs(MCor)
# Explicación: al usar el método pairwise.complete.obs, R calcula la 
# correlación de dos variables eliminado sólo los pares de valores
# de las dos variables implicadas si una de ellas toma el valor NA.
AlgunaEsNA=DFU_G_ultimas8[is.na(DFU_G_ultimas8$alcohol) | is.na(DFU_G_ultimas8$vitamin_b6),7:8]
dim(AlgunaEsNA)[1]
# La mayoría de ellas presenta, a lmenos en una variable, valores NA. Luego el método las ha eliminado.
# -------------------------------------------------------
# Pero además, hay 20 entradas en las que sí existe un par de variables numéricas
# Son las únicas que podrían ser válidas en el cálculo de datos
NoSonNingunaNA=DFU_G_ultimas8[!(is.na(DFU_G_ultimas8$alcohol) | is.na(DFU_G_ultimas8$vitamin_b6)),7:8]
dim(NoSonNingunaNA)[1]
NoSonNingunaNA
# Pero en este caso, la variable alcohol es siempre nula. Y por tanto su desv. típica es cero
# La correlación por tanto, con un factor de cero en el divisor, no está definida.
# En ambos casos, no podemos disponer de los valores de correlación entre ambas variables.

# =================
# Diagrama de calor
# =================
library("corrplot")
corrplot(abs(MCor),title = "Correlación DFU_G\nÚltimas 8 variables",
         method="color",type="full",tl.col="black",
         cl.cex=0.9, addgrid.col="royalblue4",bg="yellow",
         tl.offset = 1, cl.align.text="c", cl.pos = "n", cl.ratio=0.2,
         addCoef.col=c("black"),mar=c(2,0,4,0))

# Presenta datos ordenados
n=length(DFU_G_ultimas8)
indices=upper.tri(diag(n))
medidas=names(DFU_G_ultimas8)
med1=matrix(rep(medidas,times=n),nrow=n,byrow=FALSE)[indices]
med2=matrix(rep(medidas,times=n),nrow=n,byrow=TRUE)[indices]
vecMCor=as.vector(MCor)[indices]
corr_df=data.frame(med1,med2,vecMCor,corr.abs=abs(vecMCor))
corr_df_sort=corr_df[order(corr_df$vecMCor,decreasing=TRUE),]
head(corr_df_sort,3)

# Diagrama de dispersión para las dos variables
# con mayor correlación: energía y grasa
# Para una mejor visualización represento fat en abcisas
# y energy en ordenadas
plot(DFU_G_ultimas8[,2:1],pch=15,col="midnightblue",
     ylab="Energía (cal/100g)",
     xlab="Grasas gr/100gr")
l1=lm(energy~fat,data=DFU_G_ultimas8, na.action = na.omit)
abline(l1,lty="dashed",col="deepskyblue",lwd=4)
a=summary(l1)$coefficients[2]
b=summary(l1)$coefficients[1]
R2=summary(l1)$r.squared
cat("La recta de regresión lineal es energy=",a,"*fat+",b)
cat("El coeficiente de determinación es R2=",R2, " y su raíz ",sqrt(R2))
textofila1=paste("Coef. Determinación función lineal",expression(R^2),"=",round(R2,2)," // r=",round(sqrt(R2),2))
textofila2=paste("Recta de regresión: y=",round(a,2),"x +",round(b,2))
text(0,3800,labels=textofila1,cex=0.8,pos=4)
text(0,4000,labels=textofila2,cex=0.8,pos=4)
AlgunaEsNA=DFU_G_ultimas8[is.na(DFU_G_ultimas8$energy) | is.na(DFU_G_ultimas8$fat),1:2]
dim(AlgunaEsNA)[1]
head(AlgunaEsNA,10)


