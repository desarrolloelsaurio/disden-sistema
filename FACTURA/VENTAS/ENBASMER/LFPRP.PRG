********************************************************************************
*-- Programa: LFPRP.PRG
*-- Fecha   : 06-04-92 02:50am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS CON DIFERENCIA DE COSTO
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	STORE "" TO TTL,CTRL,HAY,CASOS,ACLA,LINEA,TT
	=LFPRP0()
	=WIN0()
	pag=1
	=cabpan()
	=tit_lin(1)
	SCAN FOR &FISC
		IF ROW()>21
			if hay
				IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			else
				IF !FIN_LIN(1,NUL)
					EXIT
				ENDIF
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		=LFPRP1()
	ENDSCAN
	=IIF(LAST()#27,Iif(hay,FIN_LIN(2,CASOS,FIN_SUM('TOTAL',@TTL)),FIN_LIN(2,CASOS)),"")
	=RELEWIN('WIN')
	=REOPFAC()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
USE
RETURN MEN_LIN(BOTOM)
