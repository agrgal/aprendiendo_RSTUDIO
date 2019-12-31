# Experimento del péndulo
# Fórmula = T = 2PI SQR( l / g)
l = c(100,	110,	120,	130,	140,	150	,160	,170,	180,	190,	200,	210,	220,	230,	240,	250,	260)
T = c(2.01,	2.11	,2.20,	2.29,	2.37,	2.46,	2.54,	2.62,	2.69,	2.77,	2.84	,2.91	,2.98	,3.04,	3.11,	3.17,	3.24)
# calculamos el logaritmo
logT=log(T)
logl=log(l/100) #calculo su logaritmo y lo paso a metros
# calculo su recta de regresión
l1=lm(logT~logl) #El logaritmo del período frente al tiempo
# lo dibujo
plot(logl,logT)

