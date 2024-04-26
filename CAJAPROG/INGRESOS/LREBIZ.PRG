********************************************************************************
*-- Programa: LREBIZ.PRG
*-- Fecha   : 03-31-93 01:43pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE RECIBOS EMITIDOS
********************************************************************************
EXTERNAL ARRAY TEX
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SELE CAJ
	GO TOP
	=LREBZ1(.T.)
	SCAN
		IF CAJ.NUMERE#TEX[1] .OR. PER.CLIENTE#TEX[3]
			=LrebZ1()
		ENDIF
		IF _PLINENO>63
			=fin_lin(3,NUL,fin_sum("SUBTOTAL",@TTL))
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LrebZ2()
	ENDSCAN
	=LrebZ1()
	=fin_lin(4,CASOS,fin_sum("TOTAL",@TTL))
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
