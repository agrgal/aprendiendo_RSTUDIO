cat("\014") # Borrar consola

continentes2=c("África","Asia","Europa","América N","Oceanía","América S")
library("RColorBrewer")

# ====================================================
# Histograma de frecuencias absolutas 2
# ====================================================
hist_abs2 = function (x,L,maximo=max(x),titulo="Frec. absolutas 2") {
  # calculo histograma freq=TRUE 
  h=hist(x,breaks=L,right=FALSE,freq=TRUE,
         xaxt="n", col="lightgray", # quito el eje x solo
         main=titulo,
         xlab="Intervalos y marcas de clase",
         ylab="Frecuencias absolutas",
         ylim=c(0,maximo))
  # Como axes=FALSE no dibujaba los ejes; ahora pongo el de abcisas
  axis(1,at=L) # 1--> eje X y L, las marcas de clase
  # pongo textos con las frecuencias absolutas
  text(h$mids,h$counts/2+(maximo/30)*((h$counts/2)<10),labels=h$counts
       ,col="navyblue",srt=90,cex=0.8)
}


# ====================================================
# Histograma de frecuencias relativas
# ====================================================
hist_rel=function(x,L,titulo="Frec. relativas y densidad") {
  h = hist(x,breaks=L,right=FALSE,plot=FALSE) # no lo dibujo aún
  # Calculo un máximo como o bien la mayor densidad del intervalo h$density
  # o la mayor de la función density(x)
  t=round(1.1*max(h$density,max(density(x)[[2]])),2)
  plot(h, freq=FALSE, xaxt="n",ylim=c(0,t), col="moccasin",
       main=titulo,
       xlab="Intervalos", ylab="Densidades", cex.lab=0.5)
  axis(1,at=L)
  text(h$mids,h$density/2,labels=round(h$counts/length(x),2)
       ,col="navyblue",srt=90,cex=0.8)
  lines(density(x),col="maroon4",lwd=2,lty="dashed")
  # h$density
}

# ******************************************************
# ******************************************************

# ============================
# bebidas alcohólicas globales
# ============================
BebGlobal=DFU_G[DFU_G$main_category=="Beverages" & DFU_G$alcohol>0 
                & !is.na(DFU_G$alcohol),]$alcohol
BebGlobal
length(BebGlobal)
# L=c(seq(0,15,by=1),seq(16,70,by=3))
L=c(0,2,seq(4,16,by=2),seq(18,34,by=5),seq(35,49,by=2),seq(50,70,by=5))
# L=c(seq(0,72,by=3)) # Esta parece una buena opción
L
Beb_cut=cut(BebGlobal,breaks=L,right=FALSE)
levels(Beb_cut)
hist_rel(BebGlobal,L,"Frec. Relativas de DFU_G")
hist_abs2(BebGlobal,L,400,"Hist. Frec. Abs. de DFG_U")

# ============================
# bebidas alcohólicas EUROPA
# ============================
# BebGlobal_Europa=DFU_Continentes[DFU_Continentes$main_category=="Beverages" 
#                                & DFU_Continentes$alcohol>0
#                                 & DFU_Continentes$continent=="Europe"
#                                 & !is.na(DFU_Continentes$alcohol),]$alcohol
# Beb_cut_Europa=cut(BebGlobal_Europa,breaks=L,right=FALSE)
# hist_rel(BebGlobal_Europa,L,"Frec. Relativas de bebidas alcohólicas - Europa")
# hist_abs2(BebGlobal_Europa,L,400,"Hist. Frec. Absolutas de beb. alcohólicas - Europa")

# ===================================
# bebidas alcohólicas por CONTINENTES
# ===================================
DFU_Continentes$continent=as.factor(DFU_Continentes$continent)
continentes=levels(DFU_Continentes$continent) # extrae los distintos continentes
# y los "traduce" a lo que necesito
# por cada valor del vector continentes

# layout(matrix(c(1,2,3,3,4,5),nrow=3,byrow=TRUE))
for (i in continentes){ # bucles for
  Beb = DFU_Continentes[DFU_Continentes$continent==i
                              & DFU_Continentes$main_category=="Beverages"
                              & DFU_Continentes$alcohol>0
                              & !is.na(DFU_Continentes$alcohol),]$alcohol
  ct=trimws(continentes2[which(continentes==i)]) #extrae el nombre correcto
  assign(paste0("Beb_",ct),Beb)
  Beb_cut=cut(Beb,breaks=L,right=FALSE)
  # maximotabla=max(table(Beb_cut))
  # maximotabla = ceiling(maximotabla/ (10^floor(log10(maximotabla))))*(10^floor(log10(maximotabla)))
  # cat("Maximo tabla: ",maximotabla,"\n")
  # histogramas
  if (length(Beb)>1) {
    hist_rel(Beb,L,paste0("Frec. Relativas de bebidas alcohólicas\n",ct))
    # hist_abs2(Beb,L,maximotabla,paste0("Hist. Frec. Absolutas de beb. alcohólicas\n",ct))
  }
  rm(Beb) #borro lo que no necesito
} # Fin del bucle
# layout(1)

Beb_Oceanía




