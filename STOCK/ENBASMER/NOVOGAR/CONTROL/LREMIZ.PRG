* 浜様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LREMIZ.PRG                   �
* � COMENTARIO    : LISTADO DE REMITOS IMPRESORA �
* 麺様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                     �
* � FECHA      : 11-01-93                        �
* � HORA       : 01:50:15pm                      �
* � COPYRIGHT  : 1993 by GREGORIO REINER         �
* 藩様様様様様様様様様様様様様様様様様様様様様様夕
* VERSION CONTROL DE STOCK NOVOGAR
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE REM
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LREMZ1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
