************************************
*-- Programa: LFACIZ.PRG
*-- Fecha   : 04-27-92 01:43pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE FACTURAS
************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
STORE "" TO TTL,CTRL,HAY,ACLA,LINEA,TT
STORE NUL TO acla,LINEA,TT,CASOS
DIME TTL[CANT_MAX],CTRL[CANT_MAX]
HAY=.F.
=LFACPZ0()
=CABPRI()
_PCOPIES=1
PRINTJOB
=CABPRI1()
=TIT_LIN(3)
SCAN
	IF _PLINENO>63
		=IIF(HAY,FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL)),FIN_LIN(3,NUL))
		=CABPRI1()
		=TIT_LIN(4)
	ENDI
	=LFACPZ2()
ENDSCAN
=IIF(HAY,FIN_LIN(4,NUL,FIN_SUM('TOTAL',@TTL)),FIN_LIN(4,NUL))
?
ENDP
=FINIMP()
=IAUD(FISC)
=REOPFAC()
RETURN MEN_LIN(BOTOM)
