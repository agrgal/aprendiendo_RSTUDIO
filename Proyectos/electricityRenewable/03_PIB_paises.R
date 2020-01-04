# Intenta conseguir el nombre del país según el código
codigos=factor(codigos) # los códigos de los países en datos
PIB <- read.csv("~/R/electricityRenewable/PIB_Europeo_mill_euros.csv")
PIB$UNIT=NULL
PIB$NA_ITEM=NULL
PIB$Value=as.numeric(gsub("\\s+","",as.character(PIB$Value)))
PIB$TIME=as.factor(PIB$TIME)
PIB$GEO=as.character(PIB$GEO)
names(PIB)[names(PIB)=="TIME"]="Anno"
names(PIB)[names(PIB)=="GEO"]="Codigos"
names(PIB)[names(PIB)=="Value"]="PIB"
PIB["Codigos"][PIB["Codigos"]=="UK"]="GB"
PIB["Codigos"][PIB["Codigos"]=="EL"]="GR"
str(PIB)