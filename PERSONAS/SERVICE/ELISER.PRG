* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ELISER.PRG                                               �
* � COMENTARIO    : SELECCIONA SERVICE                                       �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-25-93                                                    �
* � HORA       : 00:40:53am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
