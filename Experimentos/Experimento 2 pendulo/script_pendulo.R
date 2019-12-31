# Experimento del péndulo
# Formula = T = 2PI SQR( l / g)
l = c(100,	110,	120,	130,	140,	150	,160	,170,	180,	190,	200,	210,	220,	230,	240,	250,	260)
T = c(2.01,	2.11	,2.20,	2.29,	2.37,	2.46,	2.54,	2.62,	2.69,	2.77,	2.84	,2.91	,2.98	,3.04,	3.11,	3.17,	3.24)
# calculamos el logaritmo
logT=log(T)
logl=log(l/100) #calculo su logaritmo y lo paso a metros
# calculo su recta de regresion
l1=lm(logT~logl) #El logaritmo del periodo frente al tiempo
# lo dibujo
plot(logl,logT)
abline(l1)
# Cálculo de la gravedad
# la fórmula es así: log(T) = log(2PI/sqr(g))+0.5*log(l)
# Coeficiente 1/2?
m = l1$coefficients[2]
cat ("La pendiente de la recta es: ",m)
# Y la ordenada en el origen es igual al log(2PI/sqr(g))
# luego
n=l1$coefficients[1]
logg=2*log(2*pi)-2*n
# Por lo tanto el valor de la gravedad es
g=exp(logg)
cat("El valor de g es: ",g, "m/s2")
# Cálculo de la fiabilidad del experimento
cat("Fiabilidad R^2: ",summary(l1)$r.squared)
