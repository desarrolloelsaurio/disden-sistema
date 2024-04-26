********************************************************************************
*-- Programa: LCIUI.PRG
*-- Fecha   : 06/06/91
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE CIUDADES POR IMPRESORA
*-- Modificaci¢n GOYO 07-29-92 01:14am
*-- Modificaci¢n GOYO 12-10-92 11:28am (LSRUP1)
********************************************************************************
SELE seg
stor HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
	SELE mix
	=MEN_LIN(IMPRIMIENDO)
	SELE RUB
	SET ORDER TO tag TODOS
	stor nul TO casos
	acla='|POSIC|  CODIGO |'+PADC("SUB-RUBRO",23)+'|FECHA IN|  USUARIO |'
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	do cabpri1
	=TIT_LIN(3)
	SCAN FOR &FISC
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LSRUP1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=finimp()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
