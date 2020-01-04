setwd("~/R/electricityRenewable")
tsdcc330 <- read.delim("~/R/electricityRenewable/tsdcc330.tsv")
datos=tsdcc330
paises=datos[,1]
paises2=strsplit(as.vector(paises),",")
paises3=matrix(unlist(paises2),ncol=3,byrow=TRUE)
codigos=paises3[,3]
codigos
datos["Codigos"]=codigos
datos["Codigos"][datos["Codigos"]=="UK"]="GB"
datos["Codigos"][datos["Codigos"]=="EL"]="GR"
datos=datos[order(datos$Codigos),]
rm(paises)
rm(paises2)
rm(paises3)
datos[,1]=NULL