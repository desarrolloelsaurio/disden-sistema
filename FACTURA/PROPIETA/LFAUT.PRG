* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFAUT.PRG                           บ
* บ COMENTARIO    : LISTADO DE FACTURAS DE PROPIETARIOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                            บ
* บ FECHA      : 06-20-94                               บ
* บ HORA       : 00:17:37am                             บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

PARAMETER PORPAN
STORE (GETENV("EQUIPO")="MICASA") TO M.ENASCII
=WORKING()
=DOTALK()
TMP=GENTMP()
SELE CCP
=FLOCK() .OR. FLOK()
SORT ON FECHAVE ;
TO (TMP) FOR &FISC
SELE CCP
USE
USE (TMP) ALIAS CCP
ACLA=PAIP+;
"F. Venc."+PAIP+;
IIF(FAC5=2 .OR. FAC5=4,padc("Propietario",IIF(PORPAN,20,30))+paip,"")+;
padc("Detalle",30)+paip+;
padc("Monto",xacdigi)+paip
M.LINEA=REPL("=",LEN(ACLA))
STORE NUL TO TOTAUT,CASOS

RETURN UNTALK() .AND. ;
UNWORK() .AND. ;
IIF(PORPAN,LFAUTP(),LFAUTI()) .AND. ;
REOPCCP() .AND. ;
MEN_LIN(BOTOM)
