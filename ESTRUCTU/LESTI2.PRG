********************************************************************************
*-- Programa: LESTI2.PRG
*-- Fecha   : 06/20/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LOS ARTICULOS PARA UN PROCESO DE FABRICACION
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	=MEN_LIN(IMPRIMIENDO)
	STORE NUL TO casos
	STORE paip+padc("ARTICULO",15)+paip+PADC("DENOMINACION DEL ARTICULO",30)+'|TIEMPO ESTI|TIEMPO REAL|'+PADC("CONDICION",40)+"|FECHA IN|  USUARIO |" TO ACLA
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO LARGO
	SELE MER
	SET ORDER TO 1
	SELE est
	STORE MIN(xacancho,xachoja) TO LARGOIM
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(3)
	SCAN FOR &fisc
		IF _PLINENO>63
			=FIN_LNS(3,NUL)
			=CABPRI1()
			=TIT_LNS(4)
		ENDIF
		=LEST2()
	ENDSCAN
	=FIN_LNS(4,casos)
	EJECT PAGE
	?
	ENDP
	=finimp()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
