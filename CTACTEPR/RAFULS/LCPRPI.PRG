* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LXXXI.PRG                                                �
* � COMENTARIO    :                                                          �
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
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE CCP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
			PARSE("|SUBTOTAL|",;
			STR(M.DEBE,XACDIGI,2)+PAIP+;
			STR(M.HABER,XACDIGI,2)+PAIP+;
			STR(M.SALDO,XACDIGI,2)+PAIP,;
			LEN(ACLA))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LCPRP0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,;
			PARSE("|TOTAL|",;
			STR(M.DEBE,XACDIGI,2)+PAIP+;
			STR(M.HABER,XACDIGI,2)+PAIP+;
			STR(M.SALDO,XACDIGI,2)+PAIP,;
			LEN(ACLA)))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(PER.CODCLI+"-"+ALLTRIM(PER.CLIENTE))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
