library(MASS)
bwt=birthwt
bwt$low=factor(bwt$low,labels=c("Más de 2.5Kg","Menos de 2.5Kg"))
# bwt$race=factor(bwt$race,labels=c("blanca","negra","otra"))
bwt$smoke=factor(bwt$smoke,labels=c("No","Sí"))
bwt$ht=factor(bwt$ht,labels=c("No","Sí"))
tB1=table(bwt$low,bwt$smoke)
tB2=table(bwt$low,bwt$ht)
tB1
tB2
rtB1=round(prop.table(tB1,margin=2),2)
rtB2=round(prop.table(tB2,margin=2),2)
ftable(rtB1)
ftable(rtB2)
# plot(t(rtA),col=c("red1","brown","orange"),main="Frecuencia relativa raza - peso niño")
# barplot(rtA,col=c("red1","brown"),beside = TRUE,legend.text=TRUE,args.legend = list(cex=0.8,x=5,y=1),ylim = c(0,1))