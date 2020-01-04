# ratio por habitante
# factor= 10^floor(log10(mean(RESULTADO$poblacion)))
# RESULTADO$ratio.por.poblacion=round(factor*RESULTADO$ratio/RESULTADO$poblacion,2)

#PIB /habitante (* por 100000, ya que son millones de euros)
# RESULTADO$PIB.por.hab=round(RESULTADO$PIB/RESULTADO$poblacion,5)*1000000

# factor2= 10^floor(log10(mean(RESULTADO$PIB.por.hab)))
# RESULTADO$ratio.PIB.por.hab=round(factor2*RESULTADO$ratio/RESULTADO$PIB.por.hab,2)

factor= 10^floor(log10(mean(RESULTADO$poblacion)))
RESULTADO$ren.por.habitante=round(factor*RESULTADO$RENOVABLE/RESULTADO$poblacion,2)
maximo=max(RESULTADO$ren.por.habitante)
RESULTADO$ren.por.habitante=round(100*RESULTADO$ren.por.habitante/maximo,2)
maximo

factor2= 10^floor(log10(mean(RESULTADO$PIB)))
RESULTADO$ren.por.PIB=round(factor2*RESULTADO$RENOVABLE/RESULTADO$PIB,2)
maximo2=max(RESULTADO$ren.por.PIB)
RESULTADO$ren.por.PIB=round(100*RESULTADO$ren.por.PIB/maximo2,2)
maximo2

RESULTADO$nombrePais=droplevels(RESULTADO$nombrePais)
RESULTADO$Anno=droplevels(RESULTADO$Anno)