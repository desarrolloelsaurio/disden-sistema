*********************************
*-- Programa: VARIAB.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*********************************
VR_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
CASE VR_DIJO="Popups a Utilizar"
	DO ACPOPU.SPR
CASE VR_DIJO="Ancho de la Impresora"
	DO ACANCHO.SPR
CASE VR_DIJO="Ancho de la Hoja"
	DO ACHOJA.SPR
CASE VR_DIJO="Cantidad de D¡gitos"
	DO ACDIGI
CASE VR_DIJO="Denominaci¢n Moneda"
	DO ACAUS.SPR
CASE VR_DIJO="N§ Documentaci¢n"
	DO XANUM
case VR_DIJO="Cotizaci¢n "+alltrim(xadol)
	DO ACCOTIZ
case VR_DIJO="Recibe Impuestos"
	DO XARECIMP
CASE VR_DIJO="Alimentaci¢n del Papel"
   DO ALPAP.SPR
CASE VR_DIJO="Intereses por Mora"
	DO IINT.SPR
CASE VR_DIJO="Fechas de Vencimiento"
   DO CHVEN.SPR
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
