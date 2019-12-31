# Hay que suponer una forma para la gráfica
precio=c(15,7,6.5,6,5)
cantidad=c(100,300,600,1000,3000)
# dibujo para ver la forma
plot(cantidad,precio,type="b",lty=1) # tipo b, dibuja puntos y líneas
# ¿parece que cuando la "x" aumenta, la "y" baja? 
# podría tener la forma precio = a / cantidad + b
# ya que si cantidad -> 0, precio --> ifinito y si cantidad -> inf, precio -> 0
# como no me funciona, represento la recta precio = a log (1/ cantidad) + b
plot(log(1/cantidad),precio)
l1 = lm(precio~log(1/cantidad))
abline(l1)
# valores
a = l1$coefficients[2]
b = l1$coefficients[1]
cat ("recta de pendiente a: ",a," y de ordenada b: ",b)
cat ("De coeficiente de correlación R^2: ",summary(l1)$r.squared)
# Tenemos pues una función del precio
fprecio=function(x){round(a*log(1/x)+b,2)}
# El precio para 500 kg sería
cat ("El precio para 500kg sería ",fprecio(500),"€ ")
cat ("El precio para 50kg sería ",fprecio(50),"€ ")
cat ("El precio para 4000kg sería ",fprecio(4000),"€ ")
