********************************************************************************
*-- Programa: LRECIZ.PRG
*-- Fecha   : 08-27-92 05:53pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA POR IMPRESORA
*-- VERSION NOVOGAR
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	dime ttl[CANT_MAX]
	hay=.f.
	STORE PAIP TO TTU,ACLA,linea,ELPRO
	=lRECpz0()
	TT=TTU+CHR(13)+CHR(10)+ALLTRIM(PRO.PROVEEDOR)
	=impresor()
	stor nul TO casos
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF PER.CODCLI#ELPRO
			? M.LINEA
			ELPRO=PER.CODCLI
			TT=TTU+CHR(13)+CHR(10)+ALLTRIM(PRO.PROVEEDOR)
			=TIT_LIN(3)
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=lRECpz1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=iaud(fisc)
	=reopREC()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
