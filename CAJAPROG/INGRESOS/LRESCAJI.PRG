* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LRESCAJI.PRG         �
* � COMENTARIO    :                      �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 11-01-93                �
* � HORA       : 01:50:15pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE CAJTMP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,LRESCAJ2("TOTAL"))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LRESCAJ1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,LRESCAJ2("TOTAL"))
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
