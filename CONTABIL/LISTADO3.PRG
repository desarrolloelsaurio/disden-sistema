* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LISTADO3.PRG                                             �
* � COMENTARIO    : GENERA BASE TRUCHA DE BALANCE DE ACUERDO A FIAS          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-07-93                                                    �
* � HORA       : 08:12:02pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
