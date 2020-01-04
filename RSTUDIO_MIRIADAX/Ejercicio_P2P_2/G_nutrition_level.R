cat("\014") # Borrar consola

library(RColorBrewer)

str(DFU_Continentes)


DFU_G_sin=DFU_G[!(DFU_G$nutrition_grade_fr==""),]
DFU_G_sin$nutrition_grade_fr=droplevels(DFU_G_sin$nutrition_grade_fr)
str(DFU_G_sin)


a1=DFU_Continentes[!(DFU_Continentes$nutrition_grade_fr==""),c(2,3)]
colnames(a1)=c("Continentes","Grado.nutrición.francés")
levels(a1$Grado.nutrición.francés)
a1$Grado.nutrición.francés=droplevels(a1$Grado.nutrición.francés)
a1$Continentes = factor(a1$Continentes,labels=continentes2)
str(a1)

table(a1)
tfrec = round(prop.table(table(a1),margin=1)*100,1)
tfrec 

# barplot(t(tfrec),beside=TRUE,legend.text=TRUE)
bp = barplot(t(tfrec),col=brewer.pal(5,"GnBu")
        ,main="Porcentaje de cada grado de nutrición"
        ,beside = TRUE,legend.text=TRUE, ylab="Porcentajes"
        ,args.legend = list("topright",cex=0.9)
        ,ylim = c(0,40))

text(bp, t(tfrec)-2, paste0(t(tfrec),"%")
     ,cex=0.8, srt=90, font=2)