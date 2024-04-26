********************************************************************************
*-- Programa: LKARP.PRG
*-- Fecha    
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE KARDEX
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO LINEA,ACLA,TENK,TSAK,TENU,TSAU,CASOS,TTOK,TTOU
	=LKARP0()
	=win0()
	pag=1
	=cabpan()
	=TIT_LIN(1)
	SCAN
		IF ROW()>20
 		   IF !FIN_LIN(1,NUL,LKARP2("SUBTOTAL"))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LKARP1()
	ENDSCAN
	=FIN_LIN(2,CASOS,LKARP2("TOTAL"))
	=RELEWIN("win")
    =IAUD(FISC)
    =REOPKAR()
    SET EXAC ON
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
