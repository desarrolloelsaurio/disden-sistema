* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELIGAR.PRG                                               บ
* บ COMENTARIO    : SELECCIONA LA GARANTIA                                   บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-07-93                                                    บ
* บ HORA       : 01:58:40pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELIGAR
PARA MSG,R1,C1
SELE PER
IF GARPOP
   SET ORDER TO TAG GARANTIA
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Garantกa '+MSG,'PER','GARCOD',10,"G")
ENDIF
RETURN IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
