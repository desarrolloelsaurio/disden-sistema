* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LFAUTI.PRG                                               �
* � COMENTARIO    : LISTADO DE FACTURAS DE PROPIETARIOS                      �
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
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE CCP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
			PARSE("|SUBTOTAL",STR(M.TOTAUT,XACDIGI,2)+"|",LEN(ACLA)))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LFAUTP0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,;
	PARSE("|TOTAL",STR(M.TOTAUT,XACDIGI,2)+"|",LEN(ACLA)))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN
