cat("\014") # Borrar consola
library(corrplot)
# png(height=1200, width=1200, pointsize=25, file="overlap.png")
col1 <-rainbow(100, s = 1, v = 1, start = 0, end = 0.9, alpha = 1)
test <- matrix(data=c(20:60),nrow=7,ncol=7)
corrplot(test,tl.cex=3,title="Overlaps Between methods",
         method="circle",is.corr=FALSE,type="full",
         cl.lim=c(10,100),cl.cex=2,addgrid.col="red",
         addshade="positive",col=col1,
         addCoef.col = rgb(0,0,0, alpha=0.6),mar=c(2,2,2,2))
# dev.off()
