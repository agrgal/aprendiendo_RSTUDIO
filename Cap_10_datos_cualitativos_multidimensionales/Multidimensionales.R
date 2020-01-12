cat("\014")

# Datos cualitativos multidimensionales
# En una consulta de pediatría, hemos cargado datos de 1000 niños y niñas entre 8 y 10 años.
# Su edad, su peso, y su sexo
pediatria=read.csv("Cap10_datos_cualitativos_multidimensionales/pediatria.csv"
                   ,header=TRUE,dec=",")
Edad = pediatria$Edad
Peso = pediatria$Peso
Sexo = pediatria$Sexo
rm(pediatria)

# 1) la tabla de frecuencia absolutas puede hacerse con la orden table o ftable
# Ambas órdenes se diferencian simplemente en la forma de presentar los datos
t1=table(Edad,Peso,Sexo)
t2=ftable(Edad,Peso,Sexo)
t1
t2

# 2) Pero ftable es más adaptable. Pedo elegir qué quiero que aparezca
# en columnas, por ejemplo
cat("\014")
t2= ftable(Edad,Peso,Sexo,col.vars=c("Sexo","Edad"))
t2


# 3) Subtablas. Esto lo vimos en el caso anterior bidimensional; ahora con 3 variables.
cat("\014")
t1["8",,"F"] #Frecuencias absolutas Edad 8 años y son niñas
t2["53",] #Frecuencias absolutas de todos los niños --> da errores. Hemos utilizado 
# ftable para crearla, no table. usar ftable para presentar datos

# 4) Frecuencias relativas. t1 (con table) para calcular y ftable para presentar
cat("\014")
# 4a) globales
ftable(prop.table(t1),col.vars = c("Sexo","Edad"))
ftable(round(100*prop.table(t1),2),col.vars = c("Sexo","Edad")) #En porcentajes

# 4b) con margin =1, por tanto, considerando los QUE TIENEN LA MISMA EDAD
cat("\014")
ftable(round(100*prop.table(t1,margin=1),2),col.vars = c("Sexo","Edad")) #En porcentajes
# la tabla 1 está formada por los vectores Edad, Peso, Sexo, en ese orden.
# Luego si sumamos las frecuencias relativas filtrando por una edad
# por ejemplo 11 años, nos da 1
sum(prop.table(t1,margin=1)["11",,])

# 4b) con margin =3, por tanto, considerando los QUE TIENEN EL MISMO SEXO
cat("\014")
ftable(round(100*prop.table(t1,margin=3),2),col.vars = c("Sexo","Edad")) #En porcentajes
sum(prop.table(t1,margin=3)[,,"F"]) #por ejemplo todas las niñas

# 4c) con margin = c(1,3) considerando los que tienen el mismo SEXO y EDAD
cat("\014")
ftable(round(100*prop.table(t1,margin=c(1,3)),2),col.vars = c("Sexo","Edad")) #En porcentajes
sum(prop.table(t1,margin=c(1,3))["12",,"F"]) #por ejemplo todas las niñas de 12 años

# 4e) Convierto la tabla a otra bidimensional. 
# Por ejemplo, quiero estudiar, como en el capítulo anterior, simplemente 
# sus edades y pesos. ¿Cómo convierto los datos de la tabla de frecuencias 
# t1, a otro en el que el SEXO no tenga nada que ver? 
# pues hago otra tabla t3
cat("\014")
t3 = apply(t1,MARGIN=c(1,2),FUN=sum)
t3 # t(t3)

# 5) Gráfica de frecuencias relativas
# 5a) preparativos
cat("\014")
tfrMismoSexoEdad=round(100*prop.table(t1,margin=c(1,3)),2)["11",,"F"]
tfrMismoSexoEdad
pesos=sort(unique(Peso))
pesos
# Hay paletas de colores incluidos en R: terrain.colors(), 
# heat.colors(), topo.colors(), cm.colors(), rainbow().
colores=topo.colors(length(pesos))
colores
# Repetirlos con la opción colorRampPalette(c('green', 'darkgreen'))(length(pesos)) 
# colores = colorRampPalette(c('green', 'darkgreen'))(length(pesos)) 
leyenda=paste("Peso",pesos,sep=" ")
leyenda

#5b) La gráfica. Igual que en el caso bidimensional
old.par=par()
par=(mar=c(0.5,0.5,0.5,0.5))
migrafica = barplot(tfrMismoSexoEdad,main="Frecuencias absolutas",beside=TRUE,
        xlab="Pesos",ylab="Porcentajes",
        horiz=FALSE,col=colores, ylim=c(0,max(tfrMismoSexoEdad)+2),
        legend.text = leyenda,
        args.legend = list(title="Leyenda PESOS",x=10,y=10,cex=0.5,horiz=FALSE,
                           ncol=6,text.col="darkgreen"))
text(migrafica, tfrMismoSexoEdad + 0.1 , paste(round(tfrMismoSexoEdad, 1),"%"), cex=0.6,pos=3) 
# cambiar 0 por tfrMismoSexoEdad + 0.5
# cambiar cex=1 por otro valor
# cambiar round(tfrMismoSexoEdad, 1) por paste(round(tfrMismoSexoEdad, 1),"%")
par = old.par


