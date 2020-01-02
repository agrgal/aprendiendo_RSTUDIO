l1 = lm(Hijos~Padres,data=df_pearson)
plot(df_pearson)
abline(l1)

summary(l1) 
