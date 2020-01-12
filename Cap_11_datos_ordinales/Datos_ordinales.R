# Dentro de los datos cualitativos, RSTUDIO no sólo es capaz de guardar información como factor,
# sino también como FACTOR ORDENADO. 

# Por ejemplo, tenemos el vector de las notas que han sacado 30 estudiantes en matemáticas en un examen.
notasMat=c("Insuficiente","Insuficiente","Muy Deficiente","Notable","Notable","Notable",
           "Suficiente","Insuficiente","Sobresaliente","Insuficiente","Sobresaliente",
           "Insuficiente","Suficiente","Notable","Insuficiente","Suficiente","Bien",
           "Suficiente","Notable","Muy Deficiente","Muy Deficiente","Bien","Insuficiente","Bien",
           "Insuficiente","Muy Deficiente","Notable","Suficiente","Suficiente","Insuficiente")

# Este vector, presenta seis categorías de notas: Muy deficiente e Insuficiente son categorías negativas.
# Suficiente, Bien, Notable y Sobresaliente son categorías positivas. 

# Por tanto, si presenta categorías puede factorizarse.
notasMat=as.factor(notasMat)
notasMat # presento datos en la consola

# De hecho sus niveles se obtienen con la orden levels.
levels(notasMat)

cat("\014")
#Pero es más: puede ORDENARSE, ya que hay una lógica de ordenación en las categorías. Todos sabemos que Muy Deficiente es inferior
# a Insuficiente, y éste inferior a Suficiente, y así hasta el Sobresaliente. Luego:
notasMat=ordered(notasMat,levels=c("Muy Deficiente","Insuficiente","Suficiente","Bien","Notable","Sobresaliente"))
notasMat

#Este vector, notasMat, es ahora mismo un factor con ordenamiento en sus categorías. Es ordenado.

# =============================================================================
cat("\014")
# =============================================================================

# Podemos por lo tanto calcular su tabla de frecuencias absolutas
table(notasMat)

# o su tabla de frecuencias absolutas ACUMULADAS
cumsum(table(notasMat))

# En las tablas acumuladas, se va sumando el número de frecuencia que corresponde con las anteriores. 
# Al corresponderse con categorías acumuladas, de un solo vistazo, puedo saber que los suspensos son
# 13 y los aprobados (30-13). En la última columna aparece siempre el número de elementos.

# Y la tabla de frecuencias relativas 
prop.table(table(notasMat))*100

# Y las frecuencias relativas ACUMULADAS
frACU=cumsum(prop.table(table(notasMat)))*100

# Con la primera obtengo los porcentajes de cada calificación.
# Con la segunda, los PORCENTAJES ACUMULADOS. Así puedo saber, de un sólo vistazo, que el alumnado
# suspenso (Insuficiente o Muy deficiente es el 43.33% de la clase)
# la última columna llega siempre al 100%

barplot(frACU,main="tabla de las frecuencias relativas acumuladas")

# =============================================================================
cat("\014")
# =============================================================================

# Añadimos un vector que nos dirá si el alumno es no repetidor de la asignatura de matemáticas
repetidor=c("N","N","R","N","R","N","R","R","R","R","N","N","N","N","R","R","R","R"
            ,"N","N","N","R","R","R","R","R","R","N","N","R")

# y con él y el anterior construyo un dataframe
matematicas = data.frame(notasMat,repetidor)

# aplicamos table para ver la tabla de frecuencias
t1=table(matematicas)
t1=t(t1) # aunque mejor las calificaciones en columnas y el ser o no repetidor en filas
t1

# y usamos apply para calcular las frecuencias acumuladas. Función cumsum
apply(t1,MARGIN=1,FUN=cumsum)
# Pero, al usar apply debemos trasponer para que nos aparezca igual que antes filas y columnas
t(apply(t1,MARGIN=1,FUN=cumsum))

# O bien, su tabla de frecuencias relativas. Guardo en la variable t2 para poder dibujar la gráfica después
t2=t(apply(prop.table(t1),MARGIN=1,FUN=cumsum))
t2
barplot(t2,beside=TRUE,legend.text = levels(notasMat)
        ,args.legend=list(x="topleft",cex=0.55))