cat("\014") # Borrar consola
rm(list=ls())
FoodFactsMooc <- read.csv("RSTUDIO_MIRIADAX/Ejercicio_P2P_2/FoodFactsMooc.csv",header = TRUE)
DF_G=data.frame(FoodFactsMooc)
# rm(FoodFactsMooc)
# ========================================
# Cargar el objeto en un data frame global
# ========================================
DF_G=data.frame(FoodFactsMooc)
# head(DF_G)
# ========================================
# Crear distintos data_frames
# ========================================
DF_Europa=DF_G[DF_G$continent=="Europe",]
# DF_Europa$continent=NULL
DF_Africa=DF_G[DF_G$continent=="Africa",]
# DF_Africa$continent=NULL
DF_Asia=DF_G[DF_G$continent=="Asia",]
# DF_Asia$continent=NULL
DF_Oceania=DF_G[DF_G$continent=="Oceania",]
# DF_Oceania$continent=NULL
DF_AmericaN=DF_G[DF_G$continent=="North America",]
# DF_AmericaN$continent=NULL
DF_AmericaS=DF_G[DF_G$continent=="South America",]
# DF_AmericaS$continent=NULL
# =====================================================
# Crear distintos data_frames SIN REPETICIONES - Global
# =====================================================
DFU_G=DF_G # construyo uno único
DFU_G$continent=NULL # elimino continentes
DFU_G$country=NULL #eliminos los países
dim(DFU_G)[1]
DFU_G2=unique(DFU_G)
dim(DFU_G2)[1]
cat("El número de repeticiones fueron: ",dim(DFU_G)[1]-dim(DFU_G2)[1])
# Construyo el dat aframe definitivo
DFU_G=DFU_G2
rm(DFU_G2) # borro ya el segundo, no sirve.
# ============================
# Continentes SIN REPETICIONES
# ============================
# Europa
DFU_Europa =DF_Europa
DFU_Europa$country=NULL
DFU_Europa=unique(DFU_Europa)
# Africa
DFU_Africa =DF_Africa
DFU_Africa$country=NULL
DFU_Africa=unique(DFU_Africa)
# Asia
DFU_Asia =DF_Asia
DFU_Asia$country=NULL
DFU_Asia=unique(DFU_Asia)
# Oceania
DFU_Oceania =DF_Oceania
DFU_Oceania$country=NULL
DFU_Oceania=unique(DFU_Oceania)
# NorteAmerica
DFU_AmericaN =DF_AmericaN
DFU_AmericaN$country=NULL
DFU_AmericaN=unique(DFU_AmericaN)
#Suramérica
DFU_AmericaS =DF_AmericaS
DFU_AmericaS$country=NULL
DFU_AmericaS=unique(DFU_AmericaS)
# ===================================================
# Continentes SIN REPETICIONES en el mismo continente
# ===================================================
DFU_Continentes=data.frame(rbind(DFU_Europa,DFU_Asia,DFU_Africa,
                                 DFU_Oceania,DFU_AmericaN,
                                 DFU_AmericaS))
dim(DFU_Continentes)

