********************************************************************************
*-- Programa: LPECXI.PRG
*-- Fecha   : 02-08-93 02:10pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE NOTAS DE PEDIDO (UN PRODUCTO) POR IMPRESORA
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE "" TO ACLA,LINEA,TT
	STORE NUL TO CASOS,CP,CE,TP,TTL
	=LPECX0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
			PAIP+SPACE(8)+PAIP+;
			PADR("SUBTOTAL",14)+PAIP+STR(CP,XACDIGI)+PAIP+STR(CE,XACDIGI)+PAIP+;
			STR(CP-CE,XACDIGI)+PAIP+SPACE(8)+PAIP+SPACE(XACDIGI)+PAIP+STR(TTL,XACDIGI,2)+PAIP)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LPECX1()
	ENDSCAN
	=FIN_LIN(4,CASOS,;
	PAIP+SPACE(8)+PAIP+;
	PADR("TOTAL",14)+PAIP+STR(CP,XACDIGI)+PAIP+STR(CE,XACDIGI)+PAIP+;
	STR(CP-CE,XACDIGI)+PAIP+SPACE(8)+PAIP+SPACE(XACDIGI)+PAIP+STR(TTL,XACDIGI,2)+PAIP)
	ENDP
	=FINIMP()
	=REOPPEC()
	=IAUD(MER.ARTICULO)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
