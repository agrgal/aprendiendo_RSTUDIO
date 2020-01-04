codigos=factor(codigos) # los códigos de los países en datos
ENERGIA <- read.csv("~/R/electricityRenewable/nrg_105a_1_Data.csv")
ENERGIA$Value=as.numeric(gsub("\\s+","",as.character(ENERGIA$Value)))
ENERGIA$TIME=as.factor(ENERGIA$TIME)
ENERGIA$GEO=as.character(ENERGIA$GEO)
names(ENERGIA)[names(ENERGIA)=="TIME"]="Anno"
names(ENERGIA)[names(ENERGIA)=="GEO"]="Codigos"
names(ENERGIA)[names(ENERGIA)=="Value"]="ENERGIA"
ENERGIA["Codigos"][ENERGIA["Codigos"]=="UK"]="GB"
ENERGIA["Codigos"][ENERGIA["Codigos"]=="EL"]="GR"
