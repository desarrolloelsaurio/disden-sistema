* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LFAUT.PRG                           �
* � COMENTARIO    : LISTADO DE FACTURAS DE PROPIETARIOS �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                            �
* � FECHA      : 06-20-94                               �
* � HORA       : 00:17:37am                             �
* � COPYRIGHT  : 1994 by GREGORIO REINER                �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
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
