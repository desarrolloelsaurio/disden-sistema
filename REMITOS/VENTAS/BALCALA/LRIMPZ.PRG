********************************************************************************
*-- Programa: LremPZ.PRG
*-- Fecha   : 4-16-92
*-- Version : R. 'EL BATA'/G. REINER
*-- Notas   : IMPRESION DE RemitoS POR PANTALLA
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	store "" to ttl,ctrl,hay,casos,linea,tt,acla
	=lrimpz0()
	=WIN0()
	pag=1
	=cabpan()
	=tit_lin(1)
	SCAN for &FISC
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
		=LRIMPZ1()
	ENDSCAN
	if hay
		=FIN_LIN(2,casos,FIN_SUM('TOTAL',@TTL))
	else
		=FIN_LIN(2,casos)
	endif
	=RELEWIN('win')
	=REOPREI()
ELSE
	=iaudi()
ENDIF
=men_lin(BOTOM)
RETURN
