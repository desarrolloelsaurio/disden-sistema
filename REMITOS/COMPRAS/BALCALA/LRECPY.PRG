********************************************************************************
*-- Programa: LRECPY.PRG
*-- Fecha   : 02-11-93 01:11pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA (MERCADERIAS)
*-- VERSION BALCALA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE NUL TO acla,LINEA,TT,CASOS,tcan,tpes,tmon
	=LRECPY0(GENTMP())
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF HAYDISC
				SALIDA=FIN_LIN(1,NUL,;
				paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
				STR(TCAN,XACDIGI,2)+PAIP+;
				STR(TPES,XACDIGI,2)+PAIP+;
				STR(TMON,XACDIGI,2)+PAIP)
			ELSE
				SALIDA=FIN_LIN(1,NUL,;
				paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
				STR(TCAN,XACDIGI,2)+PAIP+;
				STR(TMON,XACDIGI,2)+PAIP)
			ENDIF
			IF !salida
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LRECPY1()
	ENDSCAN
	IF HAYDISC
		=FIN_LIN(2,casos,;
		paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
		STR(TCAN,XACDIGI,2)+PAIP+;
		STR(TPES,XACDIGI,2)+PAIP+;
		STR(TMON,XACDIGI,2)+PAIP)
	ELSE
		=FIN_LIN(2,casos,;
		paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
		STR(TCAN,XACDIGI,2)+PAIP+;
		STR(TMON,XACDIGI,2)+PAIP)
	ENDIF
	=RELEWIN("win")
	=IAUD(FISC)
	=reoprec()
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
