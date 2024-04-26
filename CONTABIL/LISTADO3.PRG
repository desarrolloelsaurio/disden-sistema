* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LISTADO3.PRG                                             บ
* บ COMENTARIO    : GENERA BASE TRUCHA DE BALANCE DE ACUERDO A FIAS          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-07-93                                                    บ
* บ HORA       : 08:12:02pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER TODAS
SELE BAL
SET ORDER TO
TMP=GENTMP()
IF TODAS
   SORT TO (TMP) ;
     ON CODIGO ;
     FOR &FISC
ELSE
   SORT TO (TMP) ;
     ON CODIGO ;
     FOR &FISC ;
     FIELD CODIGO,NOMBRE,IMPUTABLE,REPORTE,AJUSTE,NIVEL
ENDIF
SELE 0
USE (TMP) ALIAS BAL1
RETURN
