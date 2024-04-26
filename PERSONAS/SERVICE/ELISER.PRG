* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ELISER.PRG                                               บ
* บ COMENTARIO    : SELECCIONA SERVICE                                       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-25-93                                                    บ
* บ HORA       : 00:40:53am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ELISER
PARA MSG,R1,C1
SELE PER
IF SERPOP
   SET ORDER TO TAG SERVICE
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('SERVICE '+MSG,'PER','SERCOD',10)
ENDIF
RETURN IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
