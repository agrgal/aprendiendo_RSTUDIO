RESULTADO = read.csv("Informe/resultados_energia.csv")
RESULTADO$Anno=factor(RESULTADO$Anno)

library(dplyr) 
library(RColorBrewer) # Primero ordeno por año y despues por nombre Pais 

RESULTADO=arrange(RESULTADO,Anno,nombrePais)
x=as.character(RESULTADO$Anno[RESULTADO['nombrePais']=="España"])
y=RESULTADO$PIB[RESULTADO['nombrePais']=="España"]
z=RESULTADO$RENOVABLE[RESULTADO['nombrePais']=="España"]

#Gráficas para España de PIB y RENOVABLE
M=matrix(c(1,2),nrow=2,byrow=TRUE)
layout(M)
viejo.par=par()
par(mai=c(0.1,1,0.5,0.5))
plot(x,y,type="b",las=2,legend="",col=c("blue"), lwd=2
     ,xaxt="n",ylab="",ann=FALSE,pch=15)
legend("topright",legend=c("PIB en mill. Euros")
       ,col="blue",lwd=2,lty=c("solid"),pch=15)
#Gráficas para España RENOVABLE
par(mai=c(1,1,0,0.5))
plot(x,z,type="b",las=2,col=c("red"), lwd=2, pch=16
     ,xlab="Años",ylab="",xaxp=c(2006,2014,8))

par=viejo.par
layout(1)
