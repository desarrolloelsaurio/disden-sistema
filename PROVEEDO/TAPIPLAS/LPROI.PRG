********************************************************************************
*-- Programa: LPROI.PRG
*-- Fecha   : 07-15-92 03:10pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE PROVEEDORES POR IMPRESORA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	stor nul TO casos
	acla=HAZ_ACLA()
		m.linea=REPL("=",LEN(acla))
		=impresor()
		sele PRO
		SET ORDER TO TAG IIF(TYPE("ORDPRO")='U' .OR. ORDPRO,'CODPRO','PROVEEDOR')
		stor nul TO casos
		=cabpri()
		_PCOPIES=1
		PRINTJOB
		=cabpri1()
		=TIT_LIN(3)
		SCAN FOR &FISC
			IF _PLINENO>63
				=FIN_LIN(3,NUL)
				=cabpri1()
				=TIT_LIN(4)
			ENDI
			=LPRO0()
		ENDSCAN
		=FIN_LIN(4,CASOS)
		ENDP
		=FINIMP()
		=iaud(FISC)
	ELSE
		=iaudI()
	ENDIF
	=MEN_LIN(BOTOM)
RETURN
