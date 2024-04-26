********************************************************************************
*-- Programa: LRECIY.PRG
*-- Fecha   : 11-11-92 04:33pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA (MERCADERIAS)
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE NUL TO acla,LINEA,TT,CASOS,tcan,tpes,tmon
	=LRECPY0(GENTMP())
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			IF HAYDISC
				=FIN_LIN(3,NUL,;
				paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
				STR(TCAN,XACDIGI,2)+PAIP+;
				STR(TPES,XACDIGI,2)+PAIP+;
				STR(TMON,XACDIGI,2)+PAIP)
			ELSE
				=FIN_LIN(3,NUL,;
				paip+space(6)+paip+padR("SUBTOTAL",30)+PAIP+;
				STR(TCAN,XACDIGI,2)+PAIP+;
				STR(TMON,XACDIGI,2)+PAIP)
			ENDIF
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LRECPY1()
	ENDSCAN
	IF HAYDISC
		=FIN_LIN(4,CASOS,;
		paip+space(6)+paip+padR("TOTAL",30)+PAIP+;
		STR(TCAN,XACDIGI,2)+PAIP+;
		STR(TPES,XACDIGI,2)+PAIP+;
		STR(TMON,XACDIGI,2)+PAIP)
	ELSE
		=FIN_LIN(4,CASOS,;
		paip+space(6)+paip+padR("TOTAL",30)+PAIP+;
		STR(TCAN,XACDIGI,2)+PAIP+;
		STR(TMON,XACDIGI,2)+PAIP)
	ENDIF
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud(FISC)
	=reoprec()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
