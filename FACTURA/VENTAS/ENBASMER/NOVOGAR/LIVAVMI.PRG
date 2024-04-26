* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LIVAVMI.PRG                         บ
* บ COMENTARIO    : LIBRO DE IVA VENTAS POR MERCADERIAS บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                            บ
* บ FECHA      : 11-01-93                               บ
* บ HORA       : 01:50:15pm                             บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(program()) TO ULPR
=CHEQSEG()
STORE NUL TO CASOS,LINEA,ACLA
STORE NUL TO IVA09,IVA18,NGRA,CTD,TTL
STORE NUL TO TIVA09,TIVA18,TNGRA,TCTD,TTTL
=LIVAVM0()
=CABPRI()
_PCOPIES=1
PRINTJOB
=CABPRI1()
=TIT_LIN(3)
GO TOP
STORE ARTICULO TO ELART
SCAN
	=IIF(ARTICULO#ELART,LIVAVM1(),.T.)
	IF _PLINENO>63
		=LIVAVM2("SUBTOTAL")
		=FIN_LIN(3,NUL)
		=CABPRI1()
		=TIT_LIN(4)
	ENDI
	=LIVAVM3()
ENDSCAN
=LIVAVM1()
=LIVAVM2("TOTAL")
=FIN_LIN(4,CASOS)
ENDP
=FINIMP()
=iaud(FISC)
=REOPFAC()
RETURN MEN_LIN(BOTOM)
