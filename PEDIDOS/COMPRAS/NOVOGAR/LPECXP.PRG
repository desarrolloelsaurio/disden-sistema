********************************************************************************
*-- Programa: LPECXP.PRG
*-- Fecha   : 02-08-93 02:10pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE NOTAS DE PEDIDO (UN PRODUCTO) POR PANTALLA
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO ACLA,LINEA,TT
	STORE NUL TO CASOS,CP,CE,TP,TTL
	=LPECX0()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,;
				PAIP+SPACE(8)+PAIP+;
				PADR("SUBTOTAL",14)+PAIP+STR(CP,XACDIGI)+PAIP+STR(CE,XACDIGI)+PAIP+;
				STR(CP-CE,XACDIGI)+PAIP+SPACE(8)+PAIP+SPACE(XACDIGI)+PAIP+STR(TTL,XACDIGI,2)+PAIP)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LPECX1()
	ENDSCAN
	=FIN_LIN(2,CASOS,;
	PAIP+SPACE(8)+PAIP+;
	PADR("TOTAL",14)+PAIP+STR(CP,XACDIGI)+PAIP+STR(CE,XACDIGI)+PAIP+;
	STR(CP-CE,XACDIGI)+PAIP+SPACE(8)+PAIP+SPACE(XACDIGI)+PAIP+STR(TTL,XACDIGI,2)+PAIP)
	=RELEWIN("win")
	=REOPPEC()
	=IAUD(MER.ARTICULO)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
