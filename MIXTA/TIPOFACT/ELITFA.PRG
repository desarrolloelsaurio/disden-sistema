********************************************************************************
*-- Programa: ELITFA.PRG
*-- Fecha   : 09-26-92 02:29am
*-- Version : G. REINER
*-- Notas   : ELIGE TIPO DE FACTURACION
*-- Modif.  : GOYO 05-30-92 08:02pm ELIMIX
********************************************************************************
FUNCTION eliTFA
PARA msg,r1,c1
SELE mix
IF TFApop
   Set order to TAG TFAtex
   ACTI POPUP MIXpop
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('TIPO DE FACTURACION '+MSG,'MIX','TFACOD')
ENDIF
RETURN respuesta
