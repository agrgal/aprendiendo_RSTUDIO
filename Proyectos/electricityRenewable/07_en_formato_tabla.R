library(dplyr)
library(RColorBrewer)
# Primero ordeno por año y despues por nombre Pais
RESULTADO=arrange(RESULTADO,Anno,nombrePais)

# ===============================================================
# RATIO 
# ===============================================================
m1=RESULTADO$ratio # ratio por pib
m1=matrix(m1,byrow = TRUE,ncol=length(levels(RESULTADO$nombrePais)))

colnames(m1)=levels(RESULTADO$nombrePais)
rownames(m1)=levels(RESULTADO$Anno)

#Seleccionando 5 países
Media=apply(m1,FUN=mean,MARGIN=2)
m1=rbind(m1,Media)
Media=sort(Media, decreasing = TRUE)
Media
paisesEscogidos=c(names(Media)[1:3],"España",tail(names(Media),n=3))
#Seleccionando años
m2=m1[rownames(m1)[1:length(rownames(m1))-1],paisesEscogidos]
colores=colorRampPalette(c("sienna","coral","brown"))

par(cex.axis=0.8)
barplot(m2,beside=TRUE, legend=TRUE, ylim=c(0,max(m2)+20)
        # ,col=brewer.pal(length(rownames(m2)),"Greys"),
        ,col=colores(length(rownames(m2)))
        ,cex.axis=0.8, las=1
        ,main="Ratio"
        ,args.legend=list(x=60,y=100,horiz=FALSE,cex=0.9))

# ===============================================================
# RATIO POR PIB
# ===============================================================
m1=RESULTADO$ren.por.PIB # ratio por pib
m1=matrix(m1,byrow = TRUE,ncol=length(levels(RESULTADO$nombrePais)))

colnames(m1)=levels(RESULTADO$nombrePais)
rownames(m1)=levels(RESULTADO$Anno)

#Seleccionando 5 países
Media=apply(m1,FUN=mean,MARGIN=2)
m1=rbind(m1,Media)
Media=sort(Media, decreasing = TRUE)
paisesEscogidos=c(names(Media)[1:5],"España")
#Seleccionando años
m2=m1[rownames(m1)[1:length(rownames(m1))-1],paisesEscogidos]
colores=colorRampPalette(rgb(128,110,21),rgb(22,39,86),rgb(128,71,21))

par(cex.axis=0.8)
barplot(m2,beside=TRUE, legend=TRUE, ylim=c(0,max(m2))
        # ,col=brewer.pal(length(rownames(m2)),"Greys"),
        ,col=colores(length(rownames(m2)))
        ,cex.axis=0.8, las=1
        ,main="Ratio"
        ,args.legend=list(x=60,y=100,horiz=FALSE,cex=0.9))
Media

nombresMedia=rev(names(Media))
nombresMedia

# 
# # ===============================================================
# # RATIO POR PIB por Habitante
# # ===============================================================
# 
# # m1=RESULTADO$ratio.por.PIB # ratio por pib
# # m1=RESULTADO$ratio.por.poblacion # ratio por poblacion
# m1=RESULTADO$ratio.PIB.por.hab # ratio por PIB por habitante
# 
# m1=matrix(m1,byrow = TRUE,ncol=length(levels(RESULTADO$nombrePais)))
# 
# colnames(m1)=levels(RESULTADO$nombrePais)
# rownames(m1)=levels(RESULTADO$Anno)
# 
# m2=m1[,c("Alemania","España","Finlandia","Noruega","Estonia")]
# barplot(m2,beside=TRUE, legend=TRUE, ylim=c(0,max(m2)+3)
#         ,col=brewer.pal(length(rownames(m1)),"Paired"),
#         args.legend=list("center",horiz=TRUE,cex=0.8))