********************************************************************************
*-- Programa: LFACPC.PRG
*-- Fecha   : 06-04-92 02:50am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS POR PANTALLA (COSTO)
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	STORE .F. TO HAY
	STORE "" TO ACLA,LINEA,TT
	=LFACPC0()
	=WIN0()
	pag=1
	=cabpan()
	STORE nul TO casos
	=tit_lin(1)
	SCAN
		IF ROW()>21
			if hay
				IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			else
				IF !FIN_LIN(1,NUL)
					EXIT
				ENDIF
			endif
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=LFACPC1()
	ENDSCAN
	IF LAST()#27
		if hay
			=FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL))
		else
			=FIN_LIN(2,CASOS)
		endif
	ENDIF
	=RELEWIN('win')
	=REOPFAC()
ELSE
	=iaudi()
ENDIF
use
RETURN men_lin(BOTOM)
