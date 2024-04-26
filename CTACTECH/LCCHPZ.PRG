**********************************************************
*-- Programa: LCCHPZ.PRG
*-- Fecha   : 6-16-92
*-- Version : E. BANALOTTI
*-- Notas   : IMPRESION DE  CTA. CTE. CHEQUES PANTALLA
*********************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX]
	HAY=.F.
	STORE nul TO casos,ACLA,LINEA,TT
	=LCCHPZ0()
	=WIN0()
	pag=1
	=cabpan()
	=tit_lin(1)
	SCAN
		IF ROW()>21
			IF !HAY
				IF !FIN_LIN(1,NUL)
					EXIT
				ENDIF
			ELSE
				IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=lcchpz1()
		=IAUD(FISC)
	ENDSCAN
	=IIF(LAST()#27,IIF(!HAY,FIN_LIN(2,CASOS),FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL))),"")
	=RELEWIN('win')
	=REOPCCH()
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
