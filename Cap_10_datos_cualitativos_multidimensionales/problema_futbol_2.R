# Ejercicio 9. Problema Fútbol
# =============================

futbol = read.csv("Cap_09_Problemas_cualitativos_bidimensionales/futbol.csv",header=TRUE)

# Añado los partidos
futbol = rbind(futbol,data.frame(Casa=c(10,11,10),Visitante=c(0,8,9)))
tail(futbol)

# Añado la columna QUNIELA
cat("\014")
futbol$Quiniela = ((futbol$Casa-futbol$Visitante)>0)*1+((futbol$Casa-futbol$Visitante)<0)*2
futbol$Quiniela = as.factor(futbol$Quiniela)
levels(futbol$Quiniela)=c("X","1","2")
head(futbol,10)
str(futbol)

# Frecuencias absoluta y relativa
t1 = table(futbol$Casa,futbol$Visitante)
t2 = 100*prop.table(t1)

# Resultados que nunca se han producido
# Convierto la tabla de frecuencias relativas en dataframe
resultados=data.frame(t1)
resultados[resultados$Freq==0,]
n=dim(resultados[resultados$Freq==0,])[1]

# Resultado más frecuente
resultados[which(resultados$Freq==max(resultados$Freq)),]

# Frecuencia acumulada de partidos en los que el equipo de casa no marca. MARGIN=1
t3 = t(apply(t1,MARGIN=1,FUN=sum)) # Mostrar t(t3)
t4 = t(apply(prop.table(t1),MARGIN=1,FUN=sum)) #obtiene la suma total. Mostrar t(t4)
# t4 = t(apply(prop.table(t1),MARGIN=1,FUN=cumsum)) con la suma acumulada
t4[1,"0"]

# Frecuencia acumulada de partidos en los que el equipo visitante no marca. MARGIN=2
t5 = t(apply(prop.table(t1),MARGIN=2,FUN=sum)) #obtiene la suma total. Mostrar t(t5)
# t4 = t(apply(prop.table(t1),MARGIN=1,FUN=cumsum)) con la suma acumulada
t5[1,"0"]

# Gráfica de los partidos cuyo resultado es  0 - X, según los goles de los visitantes
partidos0X = t1["0",]
colores=topo.colors(length(partidos0X))
old.par=par()
par=(mar=c(0,0,0,0))
migrafica = barplot(partidos0X,main="Nº partidos 0-X ",beside=TRUE,xlab="X",ylab="Nº partidos",
                    horiz=FALSE,col=colores, ylim=c(0,max(partidos0X)+20),
                    legend.text =names(t1["0",]),
                    args.legend = list(x=20,y=40,cex=0.5,horiz=TRUE,text.col="darkgreen"))
text(migrafica, partidos0X + 0.1 , partidos0X, cex=0.6,pos=3) 
par = old.par
