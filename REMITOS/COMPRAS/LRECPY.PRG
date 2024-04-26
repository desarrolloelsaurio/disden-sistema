********************************************************************************
*-- Programa: LRECPY.PRG
*-- Fecha   : 11-11-92 02:02pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA POR PANTALLA C/DISCRIM MERCADER
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE NUL TO acla,LINEA,TT,CASOS,tcan,tpes,tmon
	=LRECPY0(GENTMP())
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF HAYDISC
				IF !FIN_LIN(1,NUL,;
						paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
						STR(TCAN,XACDIGI,2)+PAIP+;
						STR(TPES,XACDIGI,2)+PAIP+;
						STR(TMON,XACDIGI,2)+PAIP)
					EXIT
				ENDIF
			ELSE
				IF !FIN_LIN(1,NUL,;
						paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
						STR(TCAN,XACDIGI,2)+PAIP+;
						STR(TMON,XACDIGI,2)+PAIP)
					EXIT
				ENDIF
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LRECPY1()
	ENDSCAN
	IF HAYDISC
		=FIN_LIN(2,CASOS,;
			paip+space(6)+paip+padR("TOTAL",30)+PAIP+;
			STR(TCAN,XACDIGI,2)+PAIP+;
			STR(TPES,XACDIGI,2)+PAIP+;
			STR(TMON,XACDIGI,2)+PAIP)
	ELSE
		=FIN_LIN(2,CASOS,;
			paip+space(6)+paip+padR("TOTAL",30)+PAIP+;
			STR(TCAN,XACDIGI,2)+PAIP+;
			STR(TMON,XACDIGI,2)+PAIP)
	ENDIF
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
