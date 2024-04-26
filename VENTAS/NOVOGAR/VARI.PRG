*********************************************************************************
*-- Programa: VARI.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
VR_DIJO=ALLTRIM(PROM())
=CABPAN1()
DO CASE
CASE VR_DIJO="Largo de la Hoja"
   do largoja.spr
CASE VR_DIJO="Popups a Utilizar"
   DO acpopu.SPR
CASE VR_DIJO="Ancho de la Impresora"
   DO acancho.SPR
CASE VR_DIJO="Ancho de la Hoja"
   DO achoja.SPR
CASE VR_DIJO="Cantidad de D¡gitos"
   DO acdigi
CASE VR_DIJO="Denominaci¢n Moneda"
   DO acaus.spr
CASE VR_DIJO="Orden Listados"
   DO ordmer.SPR
CASE VR_DIJO="Precios por Defecto"
   DO xapre
CASE VR_DIJO="Stocks por Defecto"
   DO xasto
CASE VR_DIJO="Denominaci¢n Precios"
   DO xanopre
CASE VR_DIJO="N§ Lista de Precios"
   DO xanulis
CASE VR_DIJO="N§ Documentaci¢n"
   DO xanum
case VR_DIJO="Selecci¢n Mercader¡a"
	 do xamer
case VR_DIJO="Cotizaci¢n del Dolar"
	 do accotiz
ENDCASE
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)
