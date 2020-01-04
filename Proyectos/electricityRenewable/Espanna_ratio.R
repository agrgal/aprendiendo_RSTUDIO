RESULTADO = read.csv("resultados_energia.csv")
RESULTADO$Anno=factor(RESULTADO$Anno)

library(dplyr) 
library(RColorBrewer) # Primero ordeno por año y despues por nombre Pais 

RESULTADO=arrange(RESULTADO,Anno,nombrePais)

m1=RESULTADO$ratio # ratio por pib 
m1=matrix(m1,byrow = TRUE,ncol=length(levels(RESULTADO$nombrePais)))
colnames(m1)=levels(RESULTADO$nombrePais)
rownames(m1)=levels(RESULTADO$Anno)

#Seleccionando 5 países 
Media=apply(m1,FUN=mean,MARGIN=2)
m1=rbind(m1,Media)
Media=sort(Media, decreasing = TRUE)
paisesEscogidos=c("España")
#Seleccionando años
m2=as.matrix(m1[rownames(m1)[1:length(rownames(m1))-1],paisesEscogidos])
colnames(m2)=paisesEscogidos
colores=colorRampPalette(c("red","yellow"))
colores2=colorRampPalette(c("black","black"))
vectorPor=paste(as.character(round(m2,1)),"%")

par(cex.axis=1) #nombres de países más pequeños.
bp = barplot(m2,beside=TRUE,legend=FALSE,ylim=c(0,max(m2)+20)
        # ,col=brewer.pal(length(rownames(m2)),"Greys"),
        ,col=colores(length(rownames(m2)))
        ,cex.axis=1, col.axis=c("black"), font.axis=2, las=1 # etiquetas horizontales más pequeñas
        ,args.legend=list('topleft',horiz=FALSE,cex=0.7))
text(bp, m2, vectorPor,cex=0.9,pos=3,col=c("darkblue"),font=2) 
text(bp, 10, rownames(m2),cex=1.2,pos=NULL,col=colores2(length(rownames(m2))),font=2,srt=90)