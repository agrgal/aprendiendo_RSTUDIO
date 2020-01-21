df_pearson=read.table("http://aprender.uib.es/Rdir/pearson.txt",header=TRUE)
l1 = lm(Hijos~Padres,data=df_pearson)
plot(df_pearson)
abline(l1)

summary(l1) 

str(df_pearson)
names(df_pearson)
rownames(df_pearson)
dimnames(df_pearson)
dim(df_pearson)