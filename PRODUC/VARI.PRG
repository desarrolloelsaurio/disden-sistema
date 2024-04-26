*********************************
*-- Programa: VARI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*********************************
VAR_DIJO=alltrim(prompt())
ulpr=program()
=cabpan1()
do case
case VAR_DIJO='Popups a Utilizar'
   do acpopu.spr
case VAR_DIJO='Ancho de la Impresora'
   do acancho.SPR
case VAR_DIJO='Ancho de la Hoja'
   do achoja.SPR
case VAR_DIJO='Cantidad de Talles'   
   do XATAL.SPR
case VAR_DIJO="Alimentaci¢n del Papel"
   do alpap.spr
case VAR_DIJO="Cantidad de D¡gitos"
	do acdigi
CASE VAR_DIJO="Denominaci¢n Moneda"
	DO ACAUS.SPR
CASE VAR_DIJO="Orden de los Listados"
	DO ORDMER.SPR
case VAR_DIJO="N§ Documentaci¢n"
   do numcor
case VAR_DIJO="Selecci¢n Mercader¡a"
   do xamer
case VAR_DIJO="N§ de Remito de Reproceso"
   DO CHNREREP.SPR 
endcase
UNLO ALL
ulpr=program()
return MEN_LIN(BOTOM)
