library(MASS)
bwt=birthwt
bwt$low=factor(bwt$low,labels=c("Más de 2.5Kg","Menos de 2.5Kg"))
bwt$race=factor(bwt$race,labels=c("blanca","negra","otra"))
tA=table(bwt$low,bwt$race)
tA
rtA=round(prop.table(tA,margin=2),2)
rtA
plot(t(rtA),col=c("red1","brown","orange"),main="Frecuencia relativa raza - peso niño")
barplot(rtA,col=c("red1","brown"),beside = TRUE,legend.text=TRUE,args.legend = list(cex=0.8,x=5,y=1),ylim = c(0,1))