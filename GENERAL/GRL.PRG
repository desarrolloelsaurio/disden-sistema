********************************************************************************
*-- Programa: GRL.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP GRL
********************************************************************************
PARAMETER R,C,t
respuesta='grl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Ingresa#\<Corrige#-#\<Borra#\<Recupera#-#-#'
respuesta=respuesta+'\<Lista por Impresora#Lista \<por Pantalla#-#'
if _windows
respuesta=respuesta+'-#-#Res\<taura el Archivo'
else
respuesta=respuesta+'Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
endif
UNLO ALL
RETURN defpop()
