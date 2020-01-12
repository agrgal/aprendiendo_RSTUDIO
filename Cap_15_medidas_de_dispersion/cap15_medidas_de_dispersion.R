# Medidas de dispersión
# =====================

# Las medidas de dispersión nos informan de lo desperdigados que están los datos.

# INTRODUCCIÓN
# ============

# Ejemplo:
# 4 personas se han perdido en el bosque y, al pasar las horas, tienen mucha hambre. No encuentran
# qué comer cuando, en un claro, descubren una cabaña. Entran en ella y encuentran un pollo asado
# sobre la mesa. Imaginad las siguientes situaciones:

# A) La primera que entra se avalanza sobre el pollo, sale corriendo, se esconde en el bosque 
# y se come el pollo entero. Por lo tanto la primera se como "1" pollo, y los otros "0" pollos.
polloA=c(1,0,0,0)

# B) Las dos primeras personas entran y descubren el pollo. Se pelean por él, una le arranca un muslo,
# y la otra sale corriendo con el resto. Entonces la primera se come 3/4 del pollo, la segunda 1/4 y 
# las otras dos se quedan sin nada.
polloB=c(0.75,0.25,0,0)

#C) Las cuatros se reparten el pollo, equitativamente, y se lo comen
polloC=c(0.25,0.25,0.25,0.25)

# Podemos hacer análisis de frecuencia y medidas de posición para ver las diferencias entre las 
# situaciones anteriores. Pero es muy frecuente confiar en la media. Sin embargo, a pesar
# de que las situaciones son muy distintas, la media de cada vector es la misma: 0.25
cat("\014")
mean(polloA)
mean(polloB)
mean(polloC)

# Ni tampoco nos dice mucho la mediana y la moda, salvo que ha pasado algo extraño.
cat("\014")
median(polloA)
median(polloB)
median(polloC)
names(which(table(polloA)==max(table(polloA))))
names(which(table(polloB)==max(table(polloB))))
names(which(table(polloC)==max(table(polloC))))

# El hecho es que necesitamos una medida que nos informe de lo desperdigado que están los datos.
# Si observamos el caso A, vemos que es un caso muy extremo: alguien se comió el pollo y no dejó nada 
# a los demás. El caso B es algo menos extremo, y el C es el más equitativo. Respecto de la media,
# en el caso A los valores se alejan mucho de ella y en el caso C, coinciden con la media. 

# Parece pues que esta medida de dispersión que estoy buscando debe referirse A LA MEDIA. ¿Qué tal 
# si calculo la diferencia de cada valor del vector con la media.
difA=polloA-mean(polloA)
difA
difB=polloB-mean(polloB)
difB
difC=polloC-mean(polloC)
difC

#==========================
# Las mayores diferencias las encontramos en el primer caso, no teniendo ninguna en el tercero.
# Así que nuestro número podríamos obtenero de la suma de esos valores de diferencias... Podríamos
# estar tentados de calcularlo así, pero el caso es que las desviaciones positivas y las negativas
# se compensan, así que ¿qué hacemos? La manera más sencilla de transformar valores positivos 
# en positivos y los negativos en positivos es elevar al cuadrado.
cat("\014")
difA=difA^2
difB=difB^2
difC=difC^2
difA
difB
difC

# Y calcular ahora la suma
sum(difA)
sum(difB)
sum(difC)

# Ya sí que podemos ver que el cálculo que hemos hecho nos indica en el primer caso que hay una
# "dispersión" de 0.75, mayor que en la del caso B 0.375 y mayor que 0, donde no hay, en el caso C

# Nuestros cálculos de dispersión se basarán pues en esta idea. La diferencia con la media 
# y elevar al cuadrado.

# ============================
cat("\014")
# ============================

# Definimos pues nuestras nuevas medidas
# 1) rango o recorrido: diferencia entre el máximo y el mínimo de las observaciones
diff(range(polloA))
max(polloA)-min(polloA)

# 2) rango Intercuartílico: diferencias entre el tercer y primer cuartil --> Q0.75 - Q0.25
IQR(polloA)
quantile(polloA,0.75)-quantile(polloA,0.25)

cat("\014")
# 3) Varianza MUESTRAL (ver chuleta). Restar cada valor de su media, elevar al cuadrado, sumar 
# todos estos cálculos y dividir entre la longitud del vector menos 1
n=length(polloA)
sum((polloA-mean(polloA))^2)/(n-1)
var(polloA)

#4) Desviación típica MUESTRAL (ver chuleta): hacer la raíz cuadrada del valor anterior
sqrt(var(polloA))
sd(polloA)

cat("\014")
# 5) Varianza verdadera (ver chuleta) o varianza. Restar cada valor de su media, elevar al cuadrado, 
# sumar todos estos cálculos y dividir entre la longitud del vector. Es lo mismo que la varianza
# muestral rectificada multiplicando por n-1 y dividiendo entre n.
varVerdadera = sum((polloA-mean(polloA))^2)/(n)
varVerdadera
var(polloA)*(n-1)/n

# 6) La desviación típica verdadera o simplemente des. típica que sería la raíz de 
# la varianza, o a partir de la desv. típica MUESTRAL, multiplico por la raíz de (n-1) y divido entre
# la raíz de n
sqrt(varVerdadera)
sd(polloA)*sqrt((n-1)/n)

# ==========
# CONCLUSIÓN
# ==========
# La varianza siempre es un valor positivo. Comparando dos muestras, la que mayor varianza
# tenga, tendrá los datos más dispersos. Si ésta es cero, todos sus valores coinciden con la media.
cat("\014")
var(polloA)*(n-1)/n
var(polloB)*(n-1)/n
var(polloC)*(n-1)/n

# Una orden que nos muestra varios valores estadísticos de una muestra es summary
summary(polloA)
summary(polloB)
summary(polloC)

# Podemos obtener unas gráficas llamadas DIAGRAMAS DE CAJA (ver chuletas), donde se aprecia
# muy bien cómo se distribuyen los datos. Muchos de los parámetros de plot los acepta boxplot
boxplot(polloA,polloB,polloC,names=c("caso\nA","caso\nB","caso\nC"))
abline(h=mean(polloA),col=c("red"))

# ========
# Gráficas
# ========
# Recupero el dataframe del capítulo 10, pediatría, para ilustrar otro ejemplo de boxplot
cat("\014")
pediatria=read.csv("Cap_10_datos_cualitativos_multidimensionales/pediatria.csv"
                   ,header=TRUE,dec=",")

# Podemos obtener las gráficas boxplot de Edad y Peso del dataframe
b1 = boxplot(pediatria$Edad,pediatria$Peso,names=c("Edad","Peso"))
b2 = boxplot(pediatria$Peso~pediatria$Sexo,data=pediatria)
abline(h=mean(pediatria$Peso),col=c("darkgreen"))

# Ponemos un valor de peso muy exagerado al último dato de pediatria (¡¡72kg!!)
# Y volvemos a dibujar. Cuando existen valores muy por encima de los "whiskers"
# se dibujan con circulitos. Son valores atípicos. 
pediatria$Peso[1000]=72
b2 = boxplot(pediatria$Peso~pediatria$Sexo,data=pediatria
             ,xlab="Sexo",ylab="Peso",notch=TRUE,col=c("lightblue","lightgreen"))
abline(h=mean(pediatria$Peso),col=c("darkgreen"))

cat("\014")
str(b2)
b2$stats # valores de los whiskers y la caja intercuartílica
b2$out # los valores atípico

# y usamos la función aggregate para calcular la desviación típica muestral SEGÚN
# los sexos
cat("\014")
aggregate(Peso~Sexo,data=pediatria,FUN=sd)


