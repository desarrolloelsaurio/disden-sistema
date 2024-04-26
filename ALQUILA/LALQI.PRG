*****************************************************
*-- Programa: LALQI.PRG
*-- Fecha   : 11-17-92 09:13pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE INMUEBLES ALQUILADOS (CREO)
*****************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE '' TO acla,LINEA,TT,CASOS
	=LALQP0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LALQP1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
