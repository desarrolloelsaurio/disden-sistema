********************************************************************************
*-- Programa: LCLII.PRG
*-- Fecha   : 05-31-92 01:19pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE CLIENTES
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE PER
	SET ORDER TO TAG IIF(TYPE("ORDCLI")#'L' .OR. ORDCLI,'CODCLI','CLIENTE')
	STOR NUL TO CASOS
	ACLA=HAZ_ACLA()
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE PER
	SCAN FOR &FISC
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LCLI0()
	endscan
	ENDP
	=fin_lin(4,casos)
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
