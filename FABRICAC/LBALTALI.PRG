* 浜様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LBALTALI.PRG        �
* � COMENTARIO    : BALANCE DE TALLERES �
* 麺様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER            �
* � FECHA      : 11-01-93               �
* � HORA       : 01:50:15pm             �
* � COPYRIGHT  : 1993 by GREGORIO REINER�
* 藩様様様様様様様様様様様様様様様様様様�
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	TTA=TT
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	SELE FAX
	ELTALLER=FAX.CLIENTE
	TT=TTA+;
	CRLF+;
	ALLTRIM(ELTALLER)
	=TIT_LIN(3)
	SCAN
		IF FAX.CLIENTE#ELTALLER
			=!FIN_LIN(3,CASOS,;
			PARSE("TOTAL TALLER",;
			STR(TEEC,XACDIGI-2)+PAIP+;
			STR(TSSC,XACDIGI-2)+PAIP+;
			STR(TDIA/CASOS,3)+PAIP,LEN(ACLA)))
			ELTALLER=FAX.CLIENTE
			TT=TTA+;
			CRLF+;
			ALLTRIM(ELTALLER)
			=cabpri1()
			=TIT_LIN(3)
			STORE TTEEC+TEEC TO TTEEC
			STORE TTSSC+TSSC TO TTSSC
			STORE TTDIA+TDIA TO TTDIA
			STORE TTCASOS+CASOS TO TTCASOS

			STORE NUL TO TEEC,TSSC,CASOS,TDIA
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
			PARSE("SUBTOTAL TALLER",;
			STR(TEEC,XACDIGI-2)+PAIP+;
			STR(TSSC,XACDIGI-2)+PAIP+;
			STR(TDIA/CASOS,4)+PAIP,LEN(ACLA)))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LBALTAL0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,;
	PARSE("TOTAL TALLER",;
	STR(TEEC,XACDIGI-2)+PAIP+;
	STR(TSSC,XACDIGI-2)+PAIP+;
	STR(TDIA/CASOS,4)+PAIP,LEN(ACLA)),.T.)
	=FIN_LIN(FOUR,TTCASOS,;
	PARSE("TOTAL",;
	STR(TTEEC,XACDIGI-2)+PAIP+;
	STR(TTSSC,XACDIGI-2)+PAIP+;
	STR(TTDIA/TTCASOS,4)+PAIP,LEN(ACLA)))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
