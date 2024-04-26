*************************************************
*-- Programa: LFACPZ.PRG
*-- Fecha   : 4-16-92
*-- Version : R. 'EL BATA'/G. REINER
*-- Notas   : IMPRESION DE FACTURAS POR PANTALLA
*************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
STORE "" TO TTL,CTRL,HAY,ACLA,LINEA,TT
STORE NUL TO acla,LINEA,TT,CASOS
dime ttl[CANT_MAX],ctrl[CANT_MAX]
hay=.f.
=LFACPZ0()
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
	=LFACPZ2()
ENDSCAN
=IIF(LAST()#27,IIF(HAY,FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL)),FIN_LIN(2,CASOS)),.T.)
=RELEWIN('win')
=REOPFAC()
=IAUD(FISC)
RETURN MEN_LIN(BOTOM)
