cat("\014") # Borrar consola

fNonAv=function(x){sum(is.na(x))}
fAv=function(x){sum(!is.na(x))}

a1=sapply(DFU_G[,5:12], FUN=fNonAv)
a2=sapply(DFU_G[,5:12], FUN=fAv)
n=dim(DFU_G[,5:12])[1]

DFU_G_NA=data.frame(NonAv=a1,Av=a2)
DFU_G_NA$PorNonAv=paste0(round(100*DFU_G_NA$NonAv/n,2),"%")
DFU_G_NA$PorAv=paste0(round(100*DFU_G_NA$Av/n,2),"%")
DFU_G_NA