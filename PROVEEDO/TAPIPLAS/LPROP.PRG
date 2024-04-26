********************************************************************************
*-- Programa: LPROP.PRG
*-- Fecha   : 07-15-92 02:05pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE PROVEEDORES POR PANTALLA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	sele PRO
	SET ORDER TO TAG IIF(TYPE("ORDPRO")='U' .OR. ORDPRO,'PROCOD','PROVEEDOR')
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	acla=HAZ_ACLA()
	m.linea=REPL("=",LEN(acla))
	=TIT_LIN(1)
	SCAN FOR &FISC
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LPRO0()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
