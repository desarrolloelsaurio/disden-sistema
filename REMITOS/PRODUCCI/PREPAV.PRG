****************************************************
*-- Programa: PREPAV.PRG
*-- Fecha   : 07/25/95
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE SOLICITUD DE PREPARACION 
*--			  DE AVIOS POR IMPRESORA
****************************************************
FUNCTION PREPAV
		? PAIP
		?? AVICODPRO
		?? PAIP
		?? DESCRIPCIO
		?? PAIP
		?? CANTIDAD PICT "999,999.99"
		?? PAIP
		?? left(medida,10)
		?? PAIP
RETURN .T.
