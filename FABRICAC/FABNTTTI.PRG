* 浜様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : FABNTTTI.PRG           �
* � COMENTARIO    :                        �
* 麺様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER               �
* � FECHA      : 11-01-93                  �
* � HORA       : 01:50:15pm                �
* � COPYRIGHT  : 1993 by GREGORIO REINER   �
* 藩様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=CABPRI(.F.,"36")
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3,ALLTRIM(ELPRCTEX))
	SELE FAX
	SCAN
		IF ELPRC#CLIENTE
			=FABNTTT0(3,ELPRCTEX)
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR,ALLTRIM(ELPRCTEX))
		ENDI
		=FABNTTT1()
	ENDSCAN
	=FABNTTT0(3,ELPRCTEX,.T.)
*	=FIN_LIN(FOUR,CASOSPARC,
	=FIN_LIN(FOUR,CASOS,FABNTTT2("TOTALES",TTTOT))
	ENDP
	=FINIMP()
	=IAUD("")
	=REOPFAB()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
