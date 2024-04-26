********************************************************************************
*-- Programa: ELIPAG.PRG
*-- Fecha   : 05-15-92 05:56pm03-23-92 12:20pm
*-- Version : E. BANALOTTI
*-- Notas   : ELIGE LA CONDICION DE PAGO
*-- Modificaci¢n GOYO 05-17-92 04:47pm
********************************************************************************
FUNCTION eliPAG
PARA msg,r1,c1
SELE mix
IF PAGpop
   SET ORDER TO TAG PAGTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   respuesta=elimix1('Cond. Venta '+msg,'mix','pagcod')
ENDIF
RETURN respuesta