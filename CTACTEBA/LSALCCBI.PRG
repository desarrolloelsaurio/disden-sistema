* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LSALCCCBI.ORG                                            �
* � COMENTARIO    : LISTADO DE SALDOS DE CUENTAS BANCARIAS POR IMPRESORA     �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-01-93                                                    �
* � HORA       : 01:50:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
=CHEQSEG()
STOR NUL TO CASOS
=CABPRI()
_PCOPIES=1
PRINTJOB
=CABPRI1()
=TIT_LIN(3)
SCAN
	IF _PLINENO>63
		=FIN_LIN(3,NUL,LSALCCB2("SUBTOTAL"))
		=cabpri1()
		=TIT_LIN(FOUR)
	ENDI
	=LSALCCB1()
ENDSCAN
=FIN_LIN(FOUR,CASOS,LSALCCB2("TOTAL"))
ENDP
=FINIMP()
=IAUD("")
RETURN MEN_LIN(BOTOM)
