********************************************
*-- Programa: lFACpr.prg
*-- Fecha   : 08/25/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE RESUMEN DE FACURAS
********************************************
ULPR=HORA_ULP(PROGRAM())
=CHEQSEG()
store nul to can,tcan,TOT,TTOT,TFAC,FAC
STORE "" TO ELARTICULO,LAMERCA,ACLA,LAFACTURA,LNS,TT
=LFACR0()
=WIN0()
PAG=1
=CABPAN()
=TIT_LNS(1)
GO TOP
SCAN
	ELCORTE=LFACR1()
	=IIF(ELCORTE=ELARTICULO,.T.,LFACR3())
	IF ROW()=21
		IF TLFACPR1("SUBTOTAL")=27
			EXIT
		ENDIF
		CLEA
		STOR pag+1 TO pag
		=CABPAN()
		=TIT_LNS(2)
	ENDIF
	=LFACR2()
ENDSCAN
IF LAST()#27
	=LFACR3()
	=TLFACPR1("TOTAL")
ENDIF
=RELEWIN("WIN")
=REOPFAC()
RETURN MEN_LIN(BOTOM)

FUNCTION TLFACPR1
	PARAMETER COSA
	PRIVATE COSA
	? LNS
	? PAIP
	IF FILFAC=3
		?? PADR(COSA,13)
		?? PAIP
		?? SPACE(8)
	ELSE
		IF FILFEC=3
			?? PADR(COSA,8)
		else
			IF FILvia=3
				?? PADR(COSA,30)
			endif
		ENDIF
	ENDIF
	?? PAIP
	?? STR(TCAN,XACDIGI)
	?? PAIP
	IF FILFEC=3 .OR. FILVIA=3
		?? STR(TFAC,XACDIGI)
		?? PAIP
	ENDIF
	?? STR(TTOT,XACDIGI,2)
	?? PAIP
RETURN INKEY(NUL)
