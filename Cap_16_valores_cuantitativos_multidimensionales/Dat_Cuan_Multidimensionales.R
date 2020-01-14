# Datos Cuantitativos Multidimensionales
# ======================================

# Aplicamos lo que hemos aprendido ahora a un dataframe con varias informaciones. En particular,
# estudiamos una ruleta del casino. La ruleta, a lo largo de una jornada, realiza 50 tiradas. La 
# estudiamos durante una semana ¿Tiene alguna tendencia en la que salga más algún número que otro?

# 1) Cargamos el fichero con los datos
ruleta=read.csv("Cap_16_valores_cuantitativos_multidimensionales/ruleta.csv",header=TRUE)

# 2) Obtenemos un vector con las medias. Orden SAPPLY. Se aplica a todas las columnas
cat("\014")
ruletaMedia = sapply(ruleta,mean)
ruletaMedia

# 3) obtenemos las varianzas muestrales y las desviaciones típicas muestrales
cat("\014")
sapply(ruleta,var)
sapply(ruleta,sd)

# 4) Pero es más interesante obtener la varianza y desviación típicas normales
# defino primero sus fórmulas
varNormal = function(x){var(x)*(length(x)-1)/length(x)}
sdNormal = function(x){sqrt(varNormal(x))}
varianzas=sapply(ruleta,varNormal)
desvtipicas=sapply(ruleta,sdNormal)
varianzas
desvtipicas

# 5) Vamos a obtener ahora lo que se llama una MATRIZ TIPIFICADA. Esta matriz se obtiene del dataframe
# restando a cada valor su media (center=TRUE) y dividiendo entre su desviación típica. 
# Al final, construyo un DATAFRAME ruleta, tipificado.
cat("\014")
ruletaTipificada = scale(ruleta,center=TRUE,scale=desvtipicas)
ruletaTipificada = data.frame(ruletaTipificada)
ruletaTipificada

# 6) Covarianza (Ver fórmula). Sin entrar en muchos detalles, la covarianza es un número que nos indicará
# lo relacionados que están dos vectores de datos. Si es un número positivo, puede haber una relación 
# entre ellos que indica que si uno crece el otro también. Si es negativo cuando uno crece, el otro decrece.
# Vamos a ver un ejemplo sencillo. Por una parte tenemos las faltas al trimestre de 10 alumnos. Por 
# otra, su número de suspensos en ese trimestre. ¿Hay una relación entre quien más falta y quien más 
# suspende?
cat("\014")
faltas=c(5,9,20,3,0,1,2,18,9,15)
suspensos=c(0,1,4,1,1,2,2,4,3,3)
cov(faltas,suspensos)

# Es de 7.75. Parece que sí, que hay cierta relación. Se puede afirmar 
# que si se falta más, se suspende más. Lo que hemos calculado es, sin embargo, la cova-
# rianza muestral. La verdadera covarianza se obtiene haciendo
cov(faltas,suspensos)*(length(faltas)-1)/length(faltas)

# A nuestros datos de la ruleta, le podemos aplicar lo mismo. Calculamos una matriz de datos
# que nos indica las varianzas y covarianzas de cada vector de datos consigo mismo
cat("\014")
n=dim(ruleta)[1] # número de filas (50 datos)
cov(ruleta)*(n-1)/n

# Los valores de la diagonal son los valores de la varianza de cada vector
sapply(ruleta,varNormal)

# 7) Correlación (de Pearson). Entre dos vectores es el resultado de dividir su covarianza entre
# el producto de sus desviaciones típicas.
cat("\014")
cor(faltas,suspensos)
# o lo que es lo mismo: divido la covarianza entre las dos desviaciones típicas. Da igual que sea o no muestral
cov(faltas,suspensos)/(sd(faltas)*sd(suspensos))
cov(faltas,suspensos)*(length(faltas)-1)/length(faltas)/(sdNormal(faltas)*sdNormal(suspensos))

# 8) Correlación. Si tengo un caso multidimensional, no bidimensional, me sale una matriz cuyos 
# elementos es la correlación entre el vector de la fila y la columna. Cuando es el mismo vector
# me sale "1"
cat("\014")
cor(ruleta)

# Y estos números significan algo más. Si un factor "rij" de correlación es 1 indica una linealidad
# perfecta y que ambos son crecientes. Si "-1" tb es lineal pero, decreciente. El factor rij al 
# cuadrado es nuestro R2 de la regresión lineal. La correlación es la covarianza normalizada.

# La correlación es la covarianza de la matriz tipificada
n=dim(ruletaTipificada)[1]
cov(ruletaTipificada)*(n-1)/n

# 9) Otro ejemplo. Tengo un vector de fuerzas. Calculo sus aceleraciones para una masa de 3Kg
m = 3
fuerza=c(5,43,56,23,12)
aceleracion=fuerza/m
# la velocidad en t=2s (desde v0=0m/s) sería V = a * t
t = 2
velocidad = aceleracion * t
# Y su energía cinética en t=2s 
energiaCinetica = 0.5*m*velocidad^2
# El dataframe "fisicas" sería
fisicas = data.frame(fuerza,aceleracion,energiaCinetica)

# Su matriz de correlación es:
cor(fisicas)
