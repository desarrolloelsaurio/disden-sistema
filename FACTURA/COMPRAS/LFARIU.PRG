***************************************************************
*-- Programa: LFARIU.PRG
*-- Fecha   : 09-29-92 04:10pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS DE COMPRA - ULTIMA OPERACION
***************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
STORE '' TO ACLA,LINEA,TT
=LFARPU0()
STOR NUL TO CASOS
LINEA=REPL("=",LEN(ACLA))
=CABPRI()
_PCOPIES=1
PRINTJOB
=CABPRI1()
=TIT_LIN(3)
STORE '' TO KODPRO,KLIENTE,FEKHA,FAKTURA,TOMON
STORE NUL TO CASOS
=LFARPU1()
SCAN
	IF _PLINENO>63
		=FIN_LIN(3,NUL)
		=cabpri1()
		=TIT_LIN(4)
	ENDI
	=IIF(KODPRO=FAR.PROCOD,LFARPU1(),LFARPU1(.T.))
ENDSCAN
=LFARPU1(.T.)
=FIN_LIN(4,CASOS)
EJECT PAGE
ENDP
=FINIMP()
=IAUD('')
RETURN MEN_LIN(BOTOM)
