* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELIETA.PRG           บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 06-02-94                บ
* บ HORA       : 10:52:26pm              บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
FUNCTION eliETA
PARA MSG,R1,C1
SELE MIX
IF ETApop
   SET ORDER TO TAG ETATEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Etapa de Producciขn '+msg,'MIX','ETACOD')
ENDIF
RETURN RESPUESTA
