* 浜様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LREMCI.PRG            �
* � COMENTARIO    :                       �
* 麺様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER              �
* � FECHA      : 11-01-93                 �
* � HORA       : 01:50:15pm               �
* � COPYRIGHT  : 1993 by GREGORIO REINER  �
* 藩様様様様様様様様様様様様様様様様様様様�
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE COR
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LREMC0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD(DTOC(M.FECINI)+"-"+DTOC(M.FECFIN))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
