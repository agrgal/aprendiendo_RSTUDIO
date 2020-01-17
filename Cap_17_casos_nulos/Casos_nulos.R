# Casos Nulos
# ===========

# Imagino estas definiciones
palabra=character(0)
numero=numeric(0)
nada=NULL

# Si observo en el environment, todas esas variables no tienen valor, están vacías. Puedo obtenerlas
# definiéndolas, como acabo de hacer, o como resultado de alguna operación.
numero2 = NULL*0

#Tengamos ahora un vector de datos con 5 números
cat("\014")
datos=c(3,6,12,98,32)
# añado un dato en la última posición... ¡No! ¡Dos más adelante!
datos[length(datos)+2]=75
datos
# En la posición sexta aparece "NA" (not available). ¿Qué ocurre si hago un cálculo con este vector?
mean(datos)
# Pues que evidentemente no puede calcular la media. Le falta un dato. A menos que le diga que retire 
# los datos NA con na.rm=TRUE
mean(datos,na.rm=TRUE)
mean(datos[-6]) # Todos quitando el 6

# Con otras funciones
cat("\014")
sum(datos,na.rm=TRUE)
na.omit(datos)
cumsum(na.omit(datos))

# ¿En qué posiciones existe NA?
cat("\014")
is.na(datos)
which(is.na(datos)) # indices de los NA
which(!is.na(datos)) # índices que sí que son datos

# ==========================================================
# Cargamos los resultados de la ruleta del ejercicio anterior
cat("\014")
ruleta=read.csv("Cap_16_valores_cuantitativos_multidimensionales/ruleta.csv",header=TRUE)
# Y fuerzo a que haya algunos valores nulos
ruleta[30,c(3,6)]=NA
ruleta[50,c(1,4)]=NA
# En las columnas 1 (lunes) y 4 (jueves) fila 50 habrá NULL, y en la del Miércoles y Sábado en la 30.
# calculando ahora sus medias
sapply(ruleta,FUN=mean) # ¡No sabe calcularla en lunes, miércoles, jueves o sábado!
sapply(ruleta,FUN=mean,na.rm=TRUE) # A menos que retire los NA.
sapply(ruleta,FUN=var) # ¡No sabe calcularla en lunes, miércoles, jueves o sábado!
sapply(ruleta,FUN=var,na.rm=TRUE) # A menos que retire los NA.

cat("\014")
# Y calculo una tabla del primer vector de la ruleta el del lunes
table(ruleta$Lunes) # parece que lo ejecuta
# Sin embargo, no tiene todos los casos
sum(table(ruleta$Lunes))

t1=table(ruleta$Lunes,ruleta$miércoles)
ftable(t1)
sum(t1) # con tablas simplemente descarta los casos NA.
ftable(round(prop.table(t1,margin=1),2)) # E igual con tablas de frecuencias relativas

# En caso de estudiar covarianzas y correlaciones se utiliza use="complete.obs"...
cat("\014")
cov(ruleta$Lunes,ruleta$miércoles)
cov(ruleta$Lunes,ruleta$miércoles,use="complete.obs")
cor(ruleta$Lunes,ruleta$miércoles,use="complete.obs")

cat("\014")
# En un caso multidimensional (con cov es lo mismo)
cor(ruleta)
# A) se eliminan directamente las filas que tengan NA (la 30 y la 50) y se realiza
# el cálculo, con 
cor(ruleta,use="complete.obs")
# B) En cada cálculo se eliminan los NA implicados (recordemos que se calcula cada dos 
# columnas) con use="pairwise.complete.obs"
cor(ruleta,use="pairwise.complete.obs")
# comparar con ambos métodos como no es lo mismo (domingo con lunes, por ejemplo o martes 
# con lunes)
