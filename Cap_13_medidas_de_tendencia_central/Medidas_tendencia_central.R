# Medidas de tendencia central
# ============================

# 1.- Obtenemos datos de un dataframe sobre edades
# En concreto, un dataframe sobre "pacientes" que ya vimos en vídeos anteriores
pacientes=read.csv("Cap_13_medidas_de_tendencia_central/pacientes.csv",header=TRUE,dec=",")
edad = pacientes$Edad #trabajaremos sólo con las edades

cat("\014")
# 2.- Moda
# la moda es el valor de mayor frecuencia, Si buscamos la tabla de frecuencias del vector edad
table(edad)
max(table(edad))
# Nos da un resultado en la edad 27 de 59 personas. Sin embargo, la moda es , en general, un vector.
# Puede que haya otra edad que tenga lamisma frecuencia. 
# en general se obtiene buscando los índices en los que los valores de frecuencia sean los máximos
which(table(edad)==max(table(edad)))
moda=names(which(table(edad)==max(table(edad))))
moda
      
cat("\014")
# 3.- Media
# La media es la suma de todas las edades entre el número total de edades 
sum(edad)/length(edad)
# o lo que es lo mismo, Multiplicar las frecuencias por su valor de edad y dividir entre la suma de todas las frecuencias
table(edad)*as.numeric(names(table(edad)))
sum(table(edad)*as.numeric(names(table(edad))))/sum(table(edad))
# Pero simplemente
media=mean(edad)
media

cat("\014")
# 4.- mediana
# la mediana se obtiene al ordenar el vector edad
ordenado = sort(edad)
ordenado
# y buscamos el valor central, el que está en el centro. 
# Si hay un número impar en el vector el valor es el que está en la posición 1+ n/2
# Si hay un número par, es la media entre los valores que están en las posiciones n/2 y 1+n/2
length(ordenado)/2
ordenado[1+length(ordenado)/2]
# Pero se obtiene con la función median
median(edad)
