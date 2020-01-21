# 1) Obtengo el dataframe pacientes
pacientes=read.csv("Cap_09_Problemas_cualitativos_bidimensionales/pacientes.csv",header=TRUE,dec=",")

# 2) Añado una fila más al dataframe para obtener 1000, con la orden rbind
nuevaFila = data.frame(Peso=c(80),Edad=c(45))
pacientes=rbind(pacientes,nuevaFila)
tail(pacientes)

# 3) Separo en dos vectores el dataframe
Edad=pacientes$Edad
Peso=pacientes$Peso

# 4) Antes de borrar el dataframe que no me sirve, aprovecho para enseñaros
# Algunas modificaciones que puedo hacerle

# 4a) Cambiar el nombre a las columnas
str(pacientes)
names(pacientes)=c("E","P") # primero es la edad y después el Peso
# o bien
names(pacientes)[2]="Lo que pesa"

# 4b) Cambiar las referencias de las filas
# Ahora mismo nos referimos numéricamente a ellas, pero no tiene por qué
# uso la orden paste
rownames(pacientes)=paste("Paciente",1:dim(pacientes)[1],sep=" ")

head(pacientes)

# 4c) Añado una nueva columna, con la orden cbind
pacientes = cbind(pacientes, Fumar=rep(c("S","N"),500))
# O bien realizando un cálculo
pacientes$calculo = pacientes$E / pacientes$`Lo que pesa`

head(pacientes,10)

# 4d) Borrado de los dataframes
rm(pacientes)
rm(nuevaFila)

# ==============================================
cat("\014") 
# ==============================================

#5) Tabla de frecuencias 
t1 = table(Peso,Edad) # Peso en filas y Edad en columnas
t1 #mostrando la tabla
t1[4,5] # mostrando la fila 4 (63 kg) y columna 5 (Edad 29)
t1[,3] #mostrando la columna 3 (Los pesos de la Edad 27)
t1[1,] #mostrando la fila 1 
t1["60",] # o bien, entre comillas, indicando su peso

# ==============================================
cat("\014") 
# ==============================================

# 6) Frecuencias relativas globales
prop.table(t1)

# 7) Frecuencias relativas, POR CADA FILA.
# uso el modificador margin=1
cat("\014") 
prop.table(t1,margin=1)
prop.table(t1,margin=1)["75",] #una fila concreta

# 8) Frecuencias relativas, POR CADA COLUMNA
# uso el modificador margin=1
cat("\014") 
prop.table(t1,margin=2)
prop.table(t1,margin=2)[,"30"] #una fila concreta, los de 30 de edad

# 9) Función SUMA aplicado a una subtabla
cat("\014") 
t2 = t1[1:4,c(1,2,3,4)]
t2
apply(t2,MARGIN=1,FUN=sum) # suma todas las columnas por cada fila
apply(t2,MARGIN=2,FUN=sum) # suma todas las filas por cada columna
sum(t2) #suma todos los componentes de la tabla 2
apply(t2,MARGIN = 1,FUN=mean) # promedio

# 9B) Función más compleja con apply
cat("\014") 
t2
apply(t2,MARGIN=2,FUN=function(x){x^2+5})

# ==============================================
cat("\014") 
# ==============================================

# 10) Dibujando gráficas
t2
barplot(t2,main="Frecuencias absolutas")
barplot(t2,main="Frecuencias absolutas",beside=TRUE)

# Más elaborado
colores=c("green","orange","blue","black")
old.par=par()
par=(mar=c(0.5,0.5,0.5,0.5))
migrafica = barplot(t2,main="Frecuencias absolutas",beside=TRUE,xlab="Edades",ylab="Números",
        horiz=FALSE,col=colores, ylim=c(0,5.0),legend.text =c("Peso 60","Peso 61","Peso 62","Peso 63"),
        args.legend = list(x=20,y=5,cex=0.5,horiz=TRUE,text.col="darkgreen"))
par = old.par
# Ver más en páginas como: https://www.r-graph-gallery.com/37-barplot-with-number-of-observation











                       
