cat("\014") # Borrar consola

continentes2=c("África","Asia","Europa","América N","Oceanía","América S")
library("RColorBrewer")
# ================================
# Diagramas de caja para el azúcar
# ================================
antiguo.par=par()
par(mar=c(4,8,4,8))
b1 = boxplot(sugars~continent, data=DFU_Continentes, horizontal=TRUE,
        main="Boxplot - Azúcar", xlab="Gramos por cada 100",
        las=1,col=brewer.pal(6,"Paired"), names=continentes2
        )
par=antiguo.par
# Valores erróneos
DFU_erroneos=DFU_Continentes[(DFU_Continentes$sugar<0 | DFU_Continentes$sugar>100) & !is.na(DFU_Continentes$sugar),]
DFU_erroneos[,c(1,2,8)]
# valores atípicos
DFU_sugar_ValAti=data.frame(ValAti=b1$out,Continente=continentes2[b1$group])
aggregate(ValAti~Continente,data=DFU_sugar_ValAti,FUN=length)
dim(DFU_Continentes[DFU_Continentes$continent=="Europe",])[1]
bsupAzucar=b1$stats[5,3] # "bigote" superior de la caja de Europa
bsupAzucar
# ================================
# Diagramas de caja para la grasa
# ================================
antiguo.par=par()
par(mar=c(4,8,4,8))
b1 = boxplot(fat~continent, data=DFU_Continentes, horizontal=TRUE,
             main="Boxplot - Grasa", xlab="Gramos por cada 100",
             las=1,col=rev(brewer.pal(6,"PuOr")), names=continentes2
)
par=antiguo.par
# Valores erróneos
DFU_erroneos=DFU_Continentes[(DFU_Continentes$fat<0 | DFU_Continentes$fat>100) & !is.na(DFU_Continentes$fat),]
DFU_erroneos[,c(1,2,7)]
# valores atípicos
DFU_fat_ValAti=data.frame(ValAti=b1$out,Continente=continentes2[b1$group])
aggregate(ValAti~Continente,data=DFU_fat_ValAti,FUN=length)
dim(DFU_Continentes[DFU_Continentes$continent=="Europe",])[1]
bsupGrasa=b1$stats[5,3] # "bigote" superior de la caja de Europa
bsupGrasa
# ================================
# Diagramas de caja para la sal
# ================================
antiguo.par=par()
par(mar=c(4,8,4,8))
b1 = boxplot(sodium~continent, data=DFU_Continentes, horizontal=TRUE,
             main="Boxplot - Sal", xlab="Gramos por cada 100", ylim=c(0,3),
             las=1,col=rev(brewer.pal(6,"Purples")), names=continentes2
)
par=antiguo.par
# Valores erróneos
DFU_erroneos=DFU_Continentes[(DFU_Continentes$sodium<0 | DFU_Continentes$sodium>100) & !is.na(DFU_Continentes$sodium),]
DFU_erroneos[,c(1,2,11)]
# valores atípicos
DFU_sodium_ValAti=data.frame(ValAti=b1$out,Continente=continentes2[b1$group])
aggregate(ValAti~Continente,data=DFU_sodium_ValAti,FUN=length)
dim(DFU_Continentes[DFU_Continentes$continent=="Europe",])[1]
bsupSal=b1$stats[5,3] # "bigote" superior de la caja de Europa
bsupSal
# =====================================
# Diagramas de caja para el nº aditivos
# =====================================
antiguo.par=par()
par(mar=c(4,8,4,8))
b1 = boxplot(additives_n~continent, data=DFU_Continentes, horizontal=TRUE,
             main="Boxplot - Nº aditivos", xlab="Nº de aditivos", 
             las=1,col=rev(brewer.pal(6,"Purples")), names=continentes2
)
par=antiguo.par
# Valores erróneos
DFU_erroneos=DFU_Continentes[(DFU_Continentes$additives_n<0 | DFU_Continentes$additives_n>100) & !is.na(DFU_Continentes$additives_n),]
DFU_erroneos[,c(1,2,11)]
# valores atípicos
DFU_additives_n_ValAti=data.frame(ValAti=b1$out,Continente=continentes2[b1$group])
aggregate(ValAti~Continente,data=DFU_additives_n_ValAti,FUN=length)
dim(DFU_Continentes[DFU_Continentes$continent=="Europe",])[1]
bsupNAditivos=b1$stats[5,1] # "bigote" superior de la caja de Africa
bsupNAditivos
