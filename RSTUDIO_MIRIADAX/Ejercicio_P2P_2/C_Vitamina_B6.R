cat("\014") # Borrar consola

# data frame con datos de vitamina B6
# Que tienen algún valor
DFU_G_vitaminaB6=DFU_G[!is.na(DFU_G$vitamin_b6),c(1,12)]
# paso a miligramos
DFU_G_vitaminaB6$vitamin_b6 = round(DFU_G_vitaminaB6$vitamin_b6*1000,3)
# Encontrar el producto que especifica el problema
library("dplyr") # cargo la biblioteca
a1=filter(DFU_G_vitaminaB6,vitamin_b6 == 0.2100, grepl('Actimel', product_name))
a1
# grepl retorna un vector lógico (todo a TRUE o FALSE) si encuentra la cadena
# dada en él. 
VB6=DFU_G_vitaminaB6$vitamin_b6
summary(VB6)
tVB6.fabs=table(VB6)
tVB6.frel=prop.table(tVB6.fabs)
tVB6.frel.acu=cumsum(tVB6.frel)
# tVB6.frel.acu
DF_VB6_Frecuencias=data.frame(CantidadVB6=rownames(tVB6.fabs)
                              ,fabs=as.numeric(tVB6.fabs)
                              ,frel=as.numeric(tVB6.frel)
                              ,frel.acu=as.numeric(tVB6.frel.acu))
DF_VB6_Frecuencias
str(DF_VB6_Frecuencias)
por0.21=DF_VB6_Frecuencias[DF_VB6_Frecuencias$CantidadVB6=="0.21",]$frel.acu
por0.21
indice0.21=which(DF_VB6_Frecuencias$CantidadVB6=="0.21")
indice0.21
porMenos0.21=DF_VB6_Frecuencias[indice0.21-1,]$frel.acu
porMenos0.21
porMasOIgual0.21=1-porMenos0.21
porMasOIgual0.21

# otra forma
sum(DF_VB6_Frecuencias[indice0.21:dim(DF_VB6_Frecuencias)[1],]$frel)


# Encontrar los 5 productos con mayor vitamina B6
vB6_cinco=head(arrange(DFU_G_vitaminaB6,desc(vitamin_b6)),5)

