***********************************************************
*-- Programa: LFARPZ.PRG
*-- Fecha   : 4-16-92
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS DE COMPRA POR PANTALLA
***********************************************************
STORE PROGRAM() TO ULPR
=CHEQSEG()
DIME TTL[CANT_MAX],CTRL[CANT_MAX]
HAY=.F.
STORE PAIP TO TT,ACLA
=LFARPZ0()
=WIN0()
pag=1
=CABPAN()
STORE nul TO casos
=TIT_LIN(1)
SCAN
	IF ROW()>21
		IF HAY
			IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
				EXIT
			ENDIF
		ELSE
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
		ENDIF
		CLEA
		STOR PAG+1 TO PAG
		=CABPAN()
		=TIT_LIN(2)
	ENDIF
	=LFARPZ2()
ENDSCAN
=IIF(LAST()=27,.T.,Iif(hay,FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL)),FIN_LIN(2,CASOS)))
=IAUD(FISC)
=RELEWIN('WIN')
=REOPFAR()
RETURN MEN_LIN(BOTOM)
