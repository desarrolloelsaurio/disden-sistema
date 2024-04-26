********************************************************************************
*-- Programa: accotiz.prg
*-- Fecha   : 11/04/90 07:27pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA ancho de la impresora
********************************************************************************
ulpr=hora_ulp(PROGRAM())
=movewin(14,27,18,66,'win',' Cotizaci¢n del '+alltrim(xadol)+' ')
@ 1,1 SAY 'COTIZACION DEL '+UPPER(XADOL) colo sche 3
vez=1
DO WHILE vez=1
vez=2
@ 1,26 GET xacOTIZ PICTURE '99999999.99';
  MESS 'Ingrese Cotizaci¢n del '+xadol
READ
ENDDO
=RELEWIN("win") 
RELE vez
=MEN_LIN(BOTOM)
RETURN
