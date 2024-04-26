********************************************************************************
*-- Programa: LREBPZ.PRG
*-- Fecha   : 03-31-93 12:02pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE RECIBOS EMITIDOS
********************************************************************************
EXTERNAL ARRAY TEX
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	=WIN0()
	pag=1
	=cabpan()
	=tit_lin(1)
	SELE CAJ
	GO TOP
	=LREBZ1(.T.)
	SCAN
		IF CAJ.NUMERE#TEX[1] .OR. PER.CLIENTE#TEX[3]
			=LrebZ1()
		ENDIF
		IF ROW()>21
			IF !fin_lin(1,NUL,fin_sum("SUBTOTAL",@TTL))
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=LrebZ2()
	ENDSCAN
	=LrebZ1()
	=fin_lin(1,NUL,fin_sum("TOTAL",@TTL))
	=RELEWIN('win')
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
RETURN men_lin(BOTOM)
