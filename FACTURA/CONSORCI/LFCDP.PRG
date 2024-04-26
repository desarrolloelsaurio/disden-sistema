**************************************************
*-- Programa: LFCDP.PRG
*-- Fecha   : 4-16-92
*-- Version : R. 'EL BATA'
*-- Notas   : IMPRESION DE FACTURAS POR PANTALLA
*************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STORE .T. TO PICU,ACLA,LINEA,TT,CASOS,PAG,HAY,TTL,GTTL
	=LFCDP0()
	=WIN0()
	=cabpan()
	=tit_lin(1)
	SCAN 
		IF ROW()>21
 		    IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))		
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=LFCDP1()
	ENDSCAN
    =FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL))			
	=RELEWIN('win')
	=IAUD(FISC)
	=REOPFAR()
ELSE
	=iaudi()
ENDIF
RETURN men_lin(BOTOM)
