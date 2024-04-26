********************************************************************************
*-- Programa: LCCHIZ.PRG
*-- Fecha   : 06-17-92 12:39pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE CUENTA CORRIENTE DE CHEQUE
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	HAY=.F.
	STORE 1 TO casos,ACLA,LINEA,TT
	=LCCHPZ0()
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=IIF(HAY,FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(3,NUL))
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=lcchpz1()
	ENDSCAN
	=IIF(HAY,FIN_LIN(4,CASOS,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(4,CASOS))
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
