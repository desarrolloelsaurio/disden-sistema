********************************************************************************
*-- Programa: GRL1.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP GRL
********************************************************************************
PARAMETER R,C,t
respuesta='grl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Ingresa#\<Corrige#-#\<Borra#\<Recupera#-#-#'
respuesta=respuesta+'\<Lista por Impresora#Lista \<por Pantalla#-#Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
RETURN defpop()
