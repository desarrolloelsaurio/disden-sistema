********************************************************************************
*-- Programa: LCCLPZ.PRG
*-- Fecha   : 05-04-92 03:48pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE CTA CTE POR PANTALLA
********************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	STORE "" TO TTL,CTRL,ACLA,LINEA,TT
	STORE .T. TO HAY
	=LCCLPZ1()
	STORE NUL TO DB,HB,CUT
	=WIN0()
	PAG=1
	=CABPAN()
	STORE NUL TO CASOS
	=tit_lin(1)
	SCAN
		IF ROW()>21
			IF !LCCLPZ2(1,NUL,'SUBTOTAL',.T.)
				EXIT
			ENDIF
			CLEA
			STOR PAG+1 TO PAG
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		=LCCLPZ0()
	ENDSCAN
	IF LAST()#27
		=LCCLPZ2(2,casos,'TOTAL',.T.)
	endif
	=RELEWIN('win')
	=REOPCCL()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
