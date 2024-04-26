************************************************************
*-- Programa: ELIban.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE EL BANCO
*-- Modificaci¢n GOYO 05-17-92 00:49am (cambio por elimix1)
************************************************************
FUNCTION eliban
PARA msg,r1,c1
priv msg,r1,c1
#DEFINE NUL  0   && NUL
SELE mix
store NUL to respuesta
IF banpop
   IF !EMPTY(MSG)
      WAIT "Banco "+MSG WIND NOWA
   ENDIF
   SET ORDER TO TAG banTEX
   ACTI POPUP BANPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   respuesta=ELIMIXN1('Banco '+msg,'mix','bancod',4)
ENDIF
RETURN respuesta
