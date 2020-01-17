# Gráficas de funciones
# =====================

# Usaremos RSTUDIO para estudiar funciones. Las funciones (de dos variables), definen 
# la relación entre unos valores en el eje X y otros en el eje Y.
# Por ejemplo, la función f(x)=x^3-2x^2-2x-7 (polinómica)
f = function(x) {x^3-2*x^2-2*x-7}

# Para representarla uso PLOT
old.par=par()
par(mar=c(5,5,5,5))
  mi = expression(x^3-2*x^2-2*x-7)
  x = -10:10 #Valores en el eje x
  plot(x,f(x),                                              # valores x e y 
       xlab="X",ylab=mi, main="Gráfica función polinómica", # títulos
       xlim=c(-10,10), ylim=c(-20,20),                      # límites que se dibujan
       col="red", lty="solid",lwd="2",type="l",             # color, línea sólida, ancho de línea y tipo
       xaxp=c(-10,10,20))                                   # 
par=old.par