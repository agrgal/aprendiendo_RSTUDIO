Nombre=c("Real Madrid","Barcelona","Sevilla","At. Madrid")
Estadio=c("Santiago Bernabeu","Nou Camp","Sánchez Pijuán","Calderón")
Aforo=c(81044,99354,40500,54907)
Equipo=data.frame(Nombre,Estadio,Aforo)
names(Equipo)=c("Denominación","Campo de Fútbol","Asistentes")
rownames(Equipo)=c("Equipo 1","Equipo 2","Equipo 3","Equipo 4")
# names(Equipo)[names(Equipo)=="Campo de Fútbol"]="campoFutbol"
# Equipo[rownames(Equipo)=="Equipo 3",]$campoFutbol="Sánchez Pizjuán"
Equipo$`Campo de Fútbol`=as.character(Equipo$`Campo de Fútbol`)
# Equipo[Equipo$`Campo de Fútbol`=="Sánchez Pijuán",]$`Campo de Fútbol`="Sánchez Pizjuán"
Equipo["Equipo 3",]$`Campo de Fútbol`="Sánchez Pizjuán"
Equipo$`Campo de Fútbol`=as.factor(Equipo$`Campo de Fútbol`)
# añadir filas
names(Equipo)[2]="Estadio"
nuevasFilas=data.frame(
   Denominación=c("At. Bilbao","Santander"),
   Estadio=c("San Mamés","Sardinero"),
   Asistentes=c(35000,45000)
   )
rownames(nuevasFilas)=c("Equipo 5","Equipo 6")
Equipo=rbind(Equipo,nuevasFilas)
# añadir campo o columna
ancho=c(60,60,55,60,50,52)
largo=c(120,120,110,115,125,98)
Equipo=cbind(Equipo,Ancho=ancho,Largo=largo)
# Área del Estadio
Equipo$Area=Equipo$Ancho*Equipo$Largo

# Seleccionar SUB DATAFRAMES
# Por filas, con los índices de las filas
Equipo[1:2,]
# Con los identificadores de las filas
Equipo[c("Equipo 3","Equipo 4"),]
# Con los índices de las filas en un orden diferente
Equipo[c(3,5,1),]
# Con una condición lógica
Equipo[Equipo$Asistentes<50000,]
Equipo[Equipo$Asistentes<50000 & Equipo$Largo<100,]

#Droplevels
Equipo2=Equipo[1:2,]
Equipo2
str(Equipo2)
Equipo2=droplevels(Equipo2)
str(Equipo2)


#Seleccionando las columnas
Equipo[,c(1,2)]
Equipo[c(1,2)]
# sin una de las columnas
Equipo[-c(3)]
# Especificando por nombre
Equipo[c("Estadio","Largo")]
# reordenando...
Equipo[c(5,4,6,3,1,2)]

#usando subset
subset(Equipo,Largo<120,select=1:3)

# Funciones
sapply(Equipo[3:6],FUN=mean)
sapply(Equipo[3:6],FUN=sum)
f=function(x){sum(x^(1/3))}
sapply(Equipo[3:6],FUN=f)

# Borrando un elemento
# Equipo[3,4]=NA
# sapply(Equipo[3:6],FUN=sum, na.rm=TRUE)

