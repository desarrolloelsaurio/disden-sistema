********************************************************************************
*-- Programa: LRECXP.PRG
*-- Fecha   : 02-08-93 02:10pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA (UN PRODUCTO) POR PANTALLA
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO ACLA,LINEA,TT
	STORE NUL TO CASOS,CP,CE,TP,TTL
	=LRECX0()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL,;
				PAIP+SPACE(8)+PAIP+;
				PADR("SUBTOTAL",14)+PAIP+STR(CP,XACDIGI)+PAIP+SPACE(14)+PAIP+;
				SPACE(8)+PAIP+SPACE(XACDIGI)+PAIP+STR(TTL,XACDIGI,2)+PAIP)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LRECX1()
	ENDSCAN
	=FIN_LIN(2,CASOS,;
	PAIP+SPACE(8)+PAIP+;
	PADR("TOTAL",14)+PAIP+STR(CP,XACDIGI)+PAIP+SPACE(14)+PAIP+;
	SPACE(8)+PAIP+SPACE(XACDIGI)+PAIP+STR(TTL,XACDIGI,2)+PAIP)
	=RELEWIN("win")
	=REOPREC()
	=iaud(ALLTRIM(MER.ARTICULO)+PAIP+MER.MERCA)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
