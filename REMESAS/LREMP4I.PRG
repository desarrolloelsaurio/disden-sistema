********************************************************************************
*-- Programa: lREMi.prg
*-- Fecha   : 03-23-92 12:17pm
*-- Version : g. reiner
*-- Notas   : IMPRESION DE PROVINCIAS POR IMPRESORA
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	 STORE "" TO M.ACLA,M.LINEA,casos,masuno,ELPRO,LAREM
	 =LREMP40()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
    =LREMP41()
	ENDSCAN
	CASOS=CASOS+1
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPREM()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
