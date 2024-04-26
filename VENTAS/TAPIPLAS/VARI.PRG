*********************************************************************************
*-- Programa: VARI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
=CABPAN1()
DIJO=alltrim(PROMPT())
DO CASE
CASE dijo='Popups a Utilizar'
   DO acpopu
CASE dijo='Ancho de la Impresora'
   DO acancho
CASE dijo='Ancho de la Hoja'
   DO achoja
CASE dijo='Cantidad de D¡gitos'
   DO acdigi
CASE dijo='Denominaci¢n Moneda'
   DO acaus
CASE dijo='Orden Listados'
   DO ordmer
CASE dijo='Denominaci¢n Precios'
   DO xanopre
CASE dijo='N§ Lista de Precios'
   DO xanulis
case dijo='Selecci¢n Mercader¡a'
	 do xamer
case dijo='Cotizaci¢n '+xadol
	 do accotiz
case dijo='IVA por Defecto'
	 do xaiva
CASE DIJO="Precios por Defecto"
	 do xapre
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
