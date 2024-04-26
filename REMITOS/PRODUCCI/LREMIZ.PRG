************************************************
*-- Programa: LREMIZ.PRG
*-- Fecha   : 03-24-93 04:06pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE REMITOS DE PRODUCCION
*************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	stor "" TO casos,tt,acla,LINEA
	=LREMPZ0()
	stor nul TO casos
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LREMPZ1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=REOPREM()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
