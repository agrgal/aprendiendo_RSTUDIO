cat("\014") # Borrar consola

library(RColorBrewer)

DFU_G_sin=DFU_G[!(DFU_G$nutrition_grade_fr==""),-1]
DFU_G_sin$nutrition_grade_fr=droplevels(DFU_G_sin$nutrition_grade_fr)
str(DFU_G_sin)

antiguo.par=par()
par(mar=c(4,8,4,8))
b1 = boxplot(sugars~nutrition_grade_fr, data=DFU_G_sin, horizontal=TRUE,
             main="Azúcar por grado de nutrición", xlab="Gramos por cada 100",
             las=1,col=brewer.pal(6,"Paired"))
par=antiguo.par
