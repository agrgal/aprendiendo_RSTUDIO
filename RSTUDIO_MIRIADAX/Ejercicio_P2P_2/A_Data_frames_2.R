cat("\014") # Borrar consola
rm(list=ls())
# ========================================
# Cargar el objeto en un data frame global
# ========================================
FoodFactsMooc <- read.csv("~/R/Ejercicio_P2P_2/FoodFactsMooc.csv",header = TRUE)
DF_G=data.frame(FoodFactsMooc)
rm(FoodFactsMooc)
# head(DF_G)
# ========================================
# Crear distintos data_frames
# ========================================
DF_G$continent=as.factor(DF_G$continent)
continentes=levels(DF_G$continent) # extrae los distintos continentes
# y los "traduce" a lo que necesito
continentes2=c("Africa","Asia","Europa","AmericaN","Oceania","AmericaS")
# por cada valor del vector continentes
for (i in continentes){ # bucles for
  DFextraer = DF_G[DF_G$continent==i,] # asigna datos filtrados
  ct=trimws(continentes2[which(continentes==i)]) #extrae el nombre correcto
  assign(paste0("DF_",ct),DFextraer) # asigna el nuevo data frame
  rm(DFextraer) #borra el data frame que no necesito
} # Fin del bucle
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
filasRepPorContinente=data.frame(Continente=character(0),Repetidos=numeric(0))
filasRepPorContinente$Continente=as.character(filasRepPorContinente$Continente)
for (i in continentes2){ # bucles for
  DFExtraer = get(paste0("DF_",i)) # asigno por nombre
  DFExtraer$country = NULL # le quito la variable país
  DFExtraer=unique(DFExtraer) # quito filas repetidas
  # Filas repetidas por continente
  filasRep=dim(get(paste0("DF_",i)))[1]-dim(DFExtraer)[1]
  filasRepPorContinente[which(continentes2==i),]=c(i,filasRep)
  # cat(paste0("Filas repetidas para ",i),filasRep,"\n")
  assign(paste0("DFU_",i),DFExtraer)
  rm(DFExtraer) # borro este data frame
  rm(filasRep)
}
filasRepPorContinente$Repetidos=as.numeric(filasRepPorContinente$Repetidos)
filasRepPorContinente
cat("En total tenemos unas",sum(filasRepPorContinente$Repetidos),"por continente")
rm(filasRepPorContinente)
# ===================================================
# Continentes SIN REPETICIONES en el mismo continente
# ===================================================
DFU_Continentes =data.frame()
for (i in continentes2){ # bucles for
  DFExtraer = get(paste0("DFU_",i)) # asigno por nombre
  DFU_Continentes=data.frame(rbind(DFU_Continentes,DFExtraer))
  rm(DFExtraer)
}
# borrado de elementos innecesarios
rm(list=ls()[!(ls()%in%ls(pattern = "DF"))])