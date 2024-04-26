********************************************************************************
*-- Programa: GRL3.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP GRL
********************************************************************************
parameter r,c,t
respuesta='grl#'+str(R)+'#'+str(C)+'#'+t+'#3#\<Ingresa#\<Corrige#-#\<Borra#\<Recupera#-#\<Lista por Impresora#'
respuesta=respuesta+'Lista \<por Pantalla#-#Posici¢n de \<Ventanas#-#Res\<taura el Archivo'
RETURN defpop()
