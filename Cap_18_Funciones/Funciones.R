# Gráficas de funciones
# =====================

# Como paso previo, os enseño como añadir bibliotecas a RSTUDIO. Dentro de la 
# pestaña packages puedo usar INSTALL ( install.packages() )
# Para este ejercicio hay que instalar: mosaic, mosaicCalc y Ryacas0

# https://cran.r-project.org/web/packages/available_packages_by_name.html

# Usaremos RSTUDIO para estudiar funciones. Las funciones (de dos variables), definen 
# la relación entre unos valores en el eje X y otros en el eje Y.
# Por ejemplo, la función f(x)=x^3-2x^2-2x-7 (polinómica)
f = function(x) x^3-2*x^2-2*x-7

# Para representarla uso PLOT
old.par=par()
par(mar=c(5,5,5,5))
  mi = body(f)                                              # expresión algebraica
  x = seq(-4,4,0.1) #Valores en el eje x
  plot(x,f(x),                                              # valores x e y 
       xlab="X",ylab=mi, main="Gráfica función polinómica", # títulos
       xlim=c(-4,4), ylim=c(-50,50),                        # límites que se dibujan
       col="red", lty="solid",lwd="2",type="l",             # color, línea sólida, ancho de línea y tipo
       xaxp=c(-4,4,20))                                     # Número de marcas en el eje X
  abline(h=0,col="blue",lwd=2,lty="dashed")                 # eje X 
  abline(v=0,col="blue",lwd=2,lty="dashed")                 # eje y
  points(3.8,f(3.8),pch=5,col="darkgreen")                  # poner un punto en pantalla
  text(3.8,f(3.8),cex=0.8,labels=c("punto representativo"),pos=2) # poner un texto en pantalla
par=old.par

# Derivada
# Se podría usar el paquete DERIV, pero vamos a utilizar los paquetes mosaic y mosaicCalc
# que previamente hemos descargado
cat("\014")
library(mosaic)
library(mosaicCalc)

# Y la derivada de la función f, g, respecto de x es:
g = D(f(x)~x) # ALT GR + 4 ~~~
g

# Encontramos los ceros y los posicionamos en la gráfica
cerosf=findZeros(f(x)~x,xlim=c(-10,10)) # encuentra los ceros de la función
cerosg=findZeros(g(x)~x,xlim=c(-10,10)) # encuentra los mínimos y los máximos
cerosf
cerosg
points(cerosf$x,f(cerosf$x),pch=7,col="black") 
points(cerosg$x,f(cerosg$x),pch=2,col="black") 

# Dibujando la derivada
curve(g(x),
      col="green", lty="solid",lwd="2",type="l",   
      add=TRUE)

# Escribiendo una leyenda
legend("top"
       ,legend=c("rojo f","verde derivada"),col=c("red","green")
       ,lwd=2, cex=0.7)

# Cálculo y dibujo de la función integral.
h = antiD(g(x)~x)
curve(h(x),
      col="salmon3", lty="solid",lwd="4",type="l",   
      add=TRUE)

# Integrales: expresión. Dibujo
library(Ryacas0)
F = function(x) 0
x = Sym('x')
body(F) = as.expression(yacas(Integrate(as.expression(body(g)), x)))
F

curve(F(x),
      col="white", lty="dashed",lwd="2",type="l",   
      add=TRUE)
