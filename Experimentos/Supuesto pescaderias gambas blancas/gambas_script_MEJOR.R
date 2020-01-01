# Hay que suponer una forma para la gráfica
precio=c(15,7,6.5,6,5)
cantidad=c(100,300,600,1000,3000)
# dibujo para ver la forma
plot(precio,cantidad,type="b",lty=1) # tipo b, dibuja puntos y líneas
# ¿parece que cuando la "x" aumenta, la "y" baja? 
# podría tener la forma precio = p0*exp(k/cantidad) o bien, precio =p0* k / cantidad
# elijo la primera opción.
plot (log(precio),(1/cantidad)) #aplicando logaritmos
# y parece que se ajusta a una curva...
l1 = lm((1/cantidad)~log(precio))
abline(l1)
# ¿Qué coeficiente tiene?
cat("Recta de regresión, coeficiente R^2: ",summary(l1)$r.squared)
# Averiguar una cantidad
# p0 se sabe con la ordenada en el origen y k con la pendiente
# ya que 1/cantidad = log(precio)/k - log(p0)/k
k = 1/l1$coefficients[2] # la inversa de la pendiente de esa recta
ordenada = l1$coefficients[1] # es la ordenada en el origen
p0 = exp(-ordenada*k)
k
p0
# entonces la funcion de los precios sería
fprecios = function(x){p0*exp(k/x)}
cat("Cuando se vendan 500 kg se harán a: ",round(fprecios(500),2),"€")
cat("Cuando se vendan 50 kg se harán a: ",round(fprecios(50),2),"€")

# ver en:https://www.geogebra.org/classic/fxgrwxvc
