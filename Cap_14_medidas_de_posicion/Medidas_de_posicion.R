# Medidas de posición
# ===================

# Las medidas de posición nos da información de cómo están distribuidos (en qué proporciones) los datos
# dentro de un vector de datos. 

# En general, se denominan CUANTILES

# Empezamos con un vector que recoge el resultado de lanzar 40 veces un dado
dado=c(1,4,3,4,5,3,2,3,4,5,2,4,5,3,2,4,6,3,4,5,2,6,3,4,1,3,2,5,1,6,3,2,6,5,2,1,2,4,2,6)
dado

# Vector que reconfiguramos para que los datos estén ordenados. No confundir con factorizar 
# un vector con ordered (dato ordinal). Simplemente usaremos la función sort
dado=sort(dado)
dado

# y observamos su tabla de frecuencias absolutas
table(dado)

#=======================================================================================
cat("\014")

# Obtenemos ahora su tabla de frecuencias relativas acumuladas
cumsum(prop.table(table(dado)))

# Por ejemplo, el porcentaje de resultados que son 3 o menores es del 52.5%. El porcentaje de resultados
# que son 4 o menos que 4 es del 75%.
# Imaginad que escojo un número, p, entre 0 y 1. Por ejemplo el 0.6 (60%). El CUANTIL de ese número
# p=0.6 es el valor del vector dado cuando está ordenado y cuya frecuencia relativa es 0.6 o inmedia-
# tamente superior.
# Observando la tabla de frecuencias relativas ACUMULADAS, el cuantil de 0.6 es el número 4,
# ya que la frecuencia del 4 es 0.75, la primera que me encuentro mayor o igual que 0.6
# Se puede calcular con la orden quantile
quantile(dado,0.6)
# Hay 7 algoritmos de cálculo para obtener el quantile, pero no nos importa. El que se usa por defecto
# es el número 7. 
quantile(dado,0.6,type=7)

cat("\014")
# Algunos CUANTILES son importantes. Por ejemplo:
# El cuantil de 0.5 ya lo hemos visto. Es la mediana.
median(dado)
quantile(dado, 0.5)
# Los cuantiles de los datos Q0.25, Q0.5, Q0.75 se llaman CUARTILES
# Por ejemplo, el primer cuartil de "dado" es 2
quantile(dado,0.25)
# Los cuantiles de 0.1, 0.2, 0.3, etc. son los llamados DECILES
# Los cuantiles de 0.01, 0.02, 0.03 etc. son los llamados PERCENTIL.