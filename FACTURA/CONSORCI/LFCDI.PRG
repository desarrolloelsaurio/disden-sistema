********************************************************************************
*-- Programa: LFCDI.PRG
*-- Fecha   : 07-19-93 04:57am
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURA DE COMPRAS Y SERVICIOS
*-- VERSION RAFULS - CONSORCIOS
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE .T. TO PICU,ACLA,LINEA,TT,CASOS,PAG,HAY
	=LFCDP0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,FIN_SUM('TOTAL',@TTL))
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LFCDP1()
	ENDSCAN
	=FIN_LIN(4,CASOS,FIN_SUM('TOTAL',@TTL))
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

