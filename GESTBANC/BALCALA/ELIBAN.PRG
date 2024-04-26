********************************************************************************
*-- Programa: ELIban.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE EL BANCO
*-- Modificaci¢n GOYO 05-17-92 00:49am (cambio por elimix1)
********************************************************************************
FUNCTION eliban
PARA msg,r1,c1
priv msg,r1,c1
SELE mix
store NUL to respuesta
IF banpop
   SET ORDER TO TAG banTEX
   ACTI POPUP BANPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   respuesta=ELIMIX1('Banco '+msg,'mix','bancod')
ENDIF
RETURN respuesta
