* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCCLR1.PRG                                               �
* � COMENTARIO    : CUERPO LISTADO CUENTA CORRIENTE CLIENTES                 �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-26-93                                                    �
* � HORA       : 02:28:48pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
? CODCLI
?? PAIP
?? left(sayper(codcli,"codcli"),25)
?? PAIP
?? gy_DEBE PICT PICU
GDEBE=GDEBE+gy_DEBE
?? PAIP
?? gy_HABER PICT PICU
GHABER=GHABER+gy_HABER
?? PAIP
?? gy_DEBE-gy_HABER PICT PICU
CASOS=CASOS+1
***ENDIF
RETURN .T.
