# Constante de los gases ideales
R = 0.082
# Cálculos de los moles a una temperatura T
T= 305
# presión
p = c(5 ,	6 ,	7 ,	8 ,	9 ,	10 	,11 ,	12 ,	13 ,	14 ,	15, 	16 ,	17, 	18, 	19)
V = c(13.51, 	11.00, 	8.70, 	8.44, 	7.50, 	6.30, 	6.14 ,	5.63 ,	5.19 ,	4.82, 	4.50, 	4.22, 	4.00, 	3.60, 	3.55)
# Fórmula p=nRT/V, O una recta p = a (1/V)  p= a inV
invV= 1/V
# recta de regresión lineal. "p" es la Y y "invV" es la X
l1 = lm(p~invV)
plot(invV,p)
abline(l1)
# cálculo de a
a = l1$coefficients[2]
# Número de moles n 
n = a/(R*T)
# Presento la solución
cat("El número de moles es n = " , n)
# Con una fiabilidad de 
summary(l1)$r.squared
plot(V,p)


