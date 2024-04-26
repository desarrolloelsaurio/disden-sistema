********************************************************************************
*-- Programa: LREMPZ.PRG
*-- Fecha   : 06-07-92 07:30pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE REMITOS DE CLIENTES POR PANTALLA
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	STORE "" TO ttl,ctrl,HAY,CASOS,LINEA,TT,ACLA
	=LREMPZ0()
	=WIN0()
	pag=1
	=cabpan()
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
		=LREMPZ1()
	ENDSCAN
	IF LAST()#27
		=Iif(hay,FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL)),FIN_LIN(2,CASOS))
	ENDIF
	=RELEWIN('win')
	=REOPREM()
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
RETURN men_lin(BOTOM)
