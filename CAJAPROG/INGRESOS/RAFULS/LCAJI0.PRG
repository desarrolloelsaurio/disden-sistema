* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCAJI0.PRG                                               บ
* บ COMENTARIO    : LISTA INGRESOS DE CAJA DE UN DIA                         บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	TT="Movimiento de Caja del "+dtoc(m.fecini)
	ACLA=PAIP+;
	padc("CLIENTE",30)+;
	PAIP+;
	PADC("DOCUMENTO",20)+;
	PAIP+;
	PADC("EFECTIVO",XACDIGI)+;
	PAIP+;
	PADC("CHEQUES",XACDIGI)+;
	PAIP

	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	store nul to EFVO,CHEQ
	SELE TMP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		? PAIP
		?? SAYPER(CODCLI,IIF(PROVEEDOR,"PRPCOD","INQCOD"))
		?? PAIP
		?? PADR(ALLTRIM(COMPRE)+" "+ALLTRIM(NUMERE),20)
		?? PAIP
		IF EMPTY(NROCHE)
		?? STR(MONTO,XACDIGI,2)
		?? PAIP
		?? STR(0,XACDIGI,2)
		EFVO=EFVO+MONTO
		ELSE
	?? STR(0,XACDIGI,2)
		?? PAIP
		?? STR(M.MONTO,XACDIGI,2)
		CHEQ=CHEQ+MONTO
	endif
			?? PAIP
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
