********************************************************************************
*-- Programa: LCNXP2.PRG
*-- Fecha   : 01-22-92 05:19pm
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE ZONAS DE UNA UNIDAD POR PANTALLA
********************************************************************************
STOR HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LNS,TT,FISC
	=LCNXP20()
	=WIN0()
	PAG=1
	=CABPAN()
	=TIT_LIN(1)
	SCAN
		IF ROW()=21
			IF !FIN_LIN(1,0)
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		=LCNXP21()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("WIN")
	=IAUD(FISC)
	=REOPCNX()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
