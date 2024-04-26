********************************************************************************
*-- Programa: xasto.prg
*-- Fecha   : 08/26/91 12:28pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA valores de stock por defecto
*-- Modificaci¢n 07-05-92 09:45pm GOYO (hora_ulp / men_lin)
*-- Modificaci¢n 07-06-92 00:00am GOYO 
********************************************************************************
ulpr=hora_ulp(PROGRAM())
=movewin(9,12,16,64,'win',' Stocks por Defecto ')
st='Stock '
picu='9999999.99'
@ 1,1 say st+'Actual' colo sche 3
@ 2,1 say st+'M¡nimo' colo sche 3
@ 3,1 say st+'M ximo' colo sche 3
@ 4,1 say st+'Reservado' colo sche 3
@ 1,35 GET xas1 pict picu;
   MESS St+'Actual'
@ 2,35 GET xas2 pict picu;
   MESS St+'M¡nimo'
@ 3,35 GET xas3 pict picu;
   MESS St+'M ximo'
@ 4,35 GET xas4 pict picu;
   MESS St+'Reservado'
READ
RETURN RELEWIN("win") .AND. men_lin(botom)
