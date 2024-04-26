* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCLR1.PRG                                               บ
* บ COMENTARIO    : CUERPO LISTADO CUENTA CORRIENTE CLIENTES                 บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-26-93                                                    บ
* บ HORA       : 02:28:48pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
