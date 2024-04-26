********************************************************************************
*-- Programa: LPOLI.PRG
*-- Fecha   : 11-09-92 07:33pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE POLIGONALES
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE "" TO TT,m.LINEA,ACLA,PICU,LIM1,PORC
	=LPOLP0()
	stor nul TO casos
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN WHILE !EOF()
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LPOLP1()
	ENDSCAN
	=LPOLP1()
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
