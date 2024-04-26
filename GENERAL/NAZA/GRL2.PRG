********************************************************************************
*-- Programa: GRL2.PRG
*-- Fecha   : 06/21/91 05:00pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP NADA
********************************************************************************
PARAMETER R,C,t,x
respuesta='nada#'+STR(R)+'#'+STR(C)+'#'+t+'#3#\<Completo#\<Rubro#\<Temporada#Se\<xo#\<L¡nea#\<Marca#\<'+mader+'#\<'+zuela+'#\<'+tella
respuesta=respuesta+'#Grupo \<Jean#\<No Grupo Jean#Por N§ de \<Plano'
if x
respuesta=respuesta+'\<Un Art¡culo'
endif
RETURN defpop()
