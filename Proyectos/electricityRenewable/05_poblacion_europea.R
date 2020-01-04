POBLACION <- read.delim("~/R/electricityRenewable/poblacion_europea.csv",sep=",")
POBLACION$INDIC_DE=NULL
POBLACION$GEO=as.character(POBLACION$GEO)
POBLACION$GEO[POBLACION$GEO=="UK"]="GB"
POBLACION$GEO[POBLACION$GEO=="EL"]="GR"
POBLACION$GEO=factor(POBLACION$GEO)
names(POBLACION)=c("Anno","Codigos","poblacion") # cambio el nombre de las columnas
RESULTADO2=merge(RESULTADO,POBLACION)
RESULTADO=RESULTADO2
rm(RESULTADO2)
RESULTADO$poblacion=as.numeric(gsub("\\s+","",as.character(RESULTADO$poblacion))) # cambio la población a números
# calculo el ratio por poblacion
str(RESULTADO)

