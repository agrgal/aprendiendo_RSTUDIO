tipo=c("moto","coche","camión")
ciudad=c("Sevilla","Cádiz","Málaga")
número=c(3000,3455,2000,1000,1500,1800,4000,2000,3034)
vehiculos=data.frame(TIPO=rep(tipo,3),CIUDAD=rep(ciudad,each=3),NUM=número)

# Suma de vehículos por ciudades
str(vehiculos)
aggregate(NUM~CIUDAD,FUN=sum,data=vehiculos)
aggregate(NUM~TIPO,FUN=sum,data=vehiculos)