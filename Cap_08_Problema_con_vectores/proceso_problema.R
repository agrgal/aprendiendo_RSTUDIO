# lectura del fichero resultado.csv
calificaciones = read.csv("Cap_08_Problema_con_vectores/resultado.csv",header=FALSE,dec=",")
# cambio de nombre de los campos
names(calificaciones)=c("notas","sexo")
# nº 1: ¿cuántos opositores se han presentado a la prueba?
dim(calificaciones)[1]
# nº 2: análisis del dataframe
str(calificaciones)
# nº 3: ¿Qué nota es la más baja?
min(calificaciones$notas)
# ¿Y la más alta?
max(calificaciones$notas)
# ¿Cúantos han sacado un cero ? ¿De qué sexo son?
which(calificaciones$notas==0)
calificaciones$sexo[which(calificaciones$notas==0)]
# ¿Cuántos han sacado la nota máxima? ¿Sexo?
which(calificaciones$notas==9.98)
calificaciones$sexo[which(calificaciones$notas==9.98)]
calificaciones$sexo[which(calificaciones$notas==max(calificaciones$notas))]

# nº 4: ¿Cuántos han aprobado? Y de ellos ¿cuántas mujeres y cuántos hombres?
which(calificaciones$notas>=5)
length(which(calificaciones$notas>=5))

# nº 5. ¿Cuántos hombres y mujeres han participado en la prueba? ¿En qué porcentaje?
table(calificaciones$sexo)
table(calificaciones$sexo)["F"]

prop.table(table(calificaciones$sexo))
t1=table(calificaciones$sexo)
prop.table(t1)

# nº 6: ¿cuál ha sido la nota de corte? ¿Qué porcentaje de los que han conseguido plaza son mu
# jeres y cuántos hombres?

calOrdenadas = calificaciones[order(calificaciones$notas,decreasing = TRUE),]
calOrdenadas=head(calOrdenadas,23)

min(calOrdenadas$notas)

prop.table(table(calOrdenadas$sexo))

# nº 7: Dibujar gráficas
barplot(table(calificaciones$sexo),col=c("green","blue"))
barplot(table(calificaciones$sexo),col=c("green","blue"),legend.text = c("Mujer","Hombre")
        ,args.legend=list(x=0.5,y=750,cex=1),xlab="Sexos",ylab="Números")
pie(table(calificaciones$sexo),main="Gráfica de tarta",labels=c("Mujeres","hombres"))
mosaicplot(table(calificaciones$sexo))











