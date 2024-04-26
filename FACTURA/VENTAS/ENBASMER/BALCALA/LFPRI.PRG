********************************************************************************
*-- Programa: LFPRI.PRG
*-- Fecha   : 07/17/92 11:23am
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS CON DIFERENCIAS DE PRECIOS
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	STORE "" TO TTL,CTRL,HAY,CASOS,ACLA,LINEA,TT
	=LFPRP0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			if hay
				IF !FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			else
				IF !FIN_LIN(3,NUL)
					EXIT
				ENDIF
			endif
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LFPRP1()
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
