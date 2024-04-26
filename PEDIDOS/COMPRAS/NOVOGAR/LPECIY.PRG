********************************************************************************
*-- Programa: LPECYI.PRG
*-- Fecha   : 02-05-93 01:55pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE PEDIDOS - RANKING POR MERCADERIA O MONTO
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	store "" to linea,acla
	STORE NUL TO GCAN,GMON
	=LPECPO(GENTMP(),B_ASE)
	stor nul TO casos
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	sele lis
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
			PADR("|SUBTOTAL",17)+PAIP+SPACE(40)+;
			IIF(FILART=1,SPACE(21)+PAIP,PAIP)+;
			STR(GCAN,XACDIGI)+PAIP+;
			STR(GMON,XACDIGI,2)+PAIP)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LPECY1()
	ENDSCAN
	=FIN_LIN(4,CASOS,;
	PADR("|TOTAL",17)+PAIP+SPACE(40)+;
	IIF(FILART=1,SPACE(21)+PAIP,PAIP)+;
	STR(GCAN,XACDIGI)+PAIP+;
	STR(GMON,XACDIGI,2)+PAIP)
	ENDP
	=FINIMP()
	=iaud(FISC)
	USE IN 25
	=REOPPEC()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
