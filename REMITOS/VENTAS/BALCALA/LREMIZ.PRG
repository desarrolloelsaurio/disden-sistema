********************************************************************************
*-- Programa: LREMIZ.PRG
*-- Fecha   : 06-07-92 10:32pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS DE CLIENTES POR IMPRESORA
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE "" TO ttl,ctrl,HAY,CASOS,LINEA,TT,ACLA
	=LREMPZ0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=IIF(HAY,FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(3,NUL))
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LREMPZ1()
	ENDSCAN
	=IIF(HAY,FIN_LIN(4,CASOS,FIN_SUM('TOTAL',@TTL)),FIN_LIN(4,CASOS))
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPREM()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
