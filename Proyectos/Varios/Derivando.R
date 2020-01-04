# Función derivada
# Ojo con los paréntesis
f =function(x) (x^3 + 3 * x^2 - 6 * x - 8)
df=function(x){}
body(df)=D(body(f),"x")
df
# Dibujo la función entre -5 y 5
plot(df,xlim=c(-5,5))
abline(h=0, lty="dotted",col="red")

library(rootSolve)
# Donde la derivada se hace cero, la función f original tiene máximos y mínimos
# Cálculo de las raíces
raices = uniroot.all(df,c(-4,2))
raices
# dibujo la función f con sus máximos y mínimos
plot(f,xlim=c(-4,4))
points(raices,f(raices),pch=19,col="red")