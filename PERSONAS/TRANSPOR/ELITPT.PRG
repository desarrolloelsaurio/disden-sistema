* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELITPT.PRG             บ
* บ COMENTARIO    : SELECCIONA TRANSPORTE  บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 01-08-98                  บ
* บ HORA       : 00:40:53am                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELITPT
PARA MSG,R1,C1
SELE PER
IF TPTPOP
   SET ORDER TO TAG TPTTEX
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('TRANSPORTE '+MSG,'PER','TPTCOD',10)
ENDIF
RETURN IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
