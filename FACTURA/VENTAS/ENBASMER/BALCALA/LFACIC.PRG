********************************************************************************
*-- Programa: LFACIC.PRG
*-- Fecha   : 06-15-92 11:34am
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS CALCULANDO BASE COSTO POR IMPRESORA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	STORE .F. TO HAY
	STORE "" TO ACLA,LINEA,TT
	=LFACPC0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			if hay
				=FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL))
			else
				=FIN_LIN(3,NUL)
			endif
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LFACPC1()
	ENDSCAN
	if hay
		=FIN_LIN(4,CASOS,FIN_SUM('TOTAL',@TTL))
	else
		=FIN_LIN(4,CASOS)
	endif
	ENDP
	=FINIMP()
	=iaud(FISC)
	=REOPFAC()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
