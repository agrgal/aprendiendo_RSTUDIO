# Los datos numéricos pueden ser tratados como números que son, o como factores (datos cualitativos)
# , definiendo categorías. Ya lo hemos visto, por ejemplo, con las edades.
# Si los tratamos como cualitativos, podemos calcular entre otras cosas, tablas de frecuencias.

# Sin embargo, hay datos que difícilmente pueden categorizarse. Por ejemplo, carguemos unos 
# datos de ejemplo que trae el propio rstudio. Uno que nos da la logitud de 141 ríos 
# americanos, en millas. 

cat ("\014")
rios = rivers
rios

# Podría categorizarlo, pero no tiene mucho sentido. De hecho, al hacerlo nos salen 114 categorías
# casi tantas como ríos hay (141)
levels(as.factor(rios))

# ¿Existe la posibilidad de categorizarlos? Por ejemplo, podría hacer catergorías
# de "ríos cortos","ríos medios" y "ríos largos"
# Pues sí. Y así podría crear categorías. Uso la orden cut
catRios = cut(rios, breaks=c(0,300,1000,Inf),labels=c("cortos","medios","largos"),
              right=FALSE)
catRios

# right = FALSE --> significa intervalos ABIERTOS a la drecha [0,300) [300,1000)
# Inf --> Infinito
# breaks --> El vector definiendo los intervalos. Observad que tiene 4 valores y hay 3 intervalos.

cat ("\014")
catRios=ordered(catRios,levels=c("cortos","medios","largos"))
catRios

table(catRios)

barplot(table(catRios),legend=TRUE, ylim=c(0,100)
        ,args.legend=c(x=32.5,horiz=TRUE,y=100))

