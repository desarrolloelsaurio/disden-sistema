* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FACRPAGP.PRG                                             บ
* บ COMENTARIO    : LISTADO DE RESUMEN DE FACTURAS POR CONDICION DE PAGO     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
=WIN0()
PAG=1
=CABPAN()
=TIT_LIN(1)
SELE FAC
GO TOP
ELTEX=FAC.TEXTO1
SCAN
	=IIF(ELTEX#TEXTO1,FACRPAG1(),.T.)
	IF ROW()>20
		=FACRPAG2("SUBTOTAL")
		IF !FIN_LIN(1,NUL)
			EXIT
		ENDIF
		CLEA
		STOR PAG+1 TO PAG
		=CABPAN()
		=TIT_LIN(2)
	ENDIF
	=FACRPAG3()
ENDSCAN
=FACRPAG1()
=FACRPAG2("TOTAL")
=FIN_LIN(2,CASOS)
=RELEWIN("win")
=IAUD(FISC)
RETURN MEN_LIN(BOTOM)
