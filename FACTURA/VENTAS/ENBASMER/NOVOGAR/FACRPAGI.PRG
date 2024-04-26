* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FACRPAGI.PRG         บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-01-93                บ
* บ HORA       : 01:50:15pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
SELE FAC
GO TOP
ELTEX=FAC.TEXTO1
=CABPRI()
_PCOPIES=1
PRINTJOB
=CABPRI1()
=TIT_LIN(3)
SCAN
	=IIF(ELTEX#TEXTO1,FACRPAG1(),.T.)
	IF _PLINENO>63
		=FACRPAG2("SUBTOTAL")
		=FIN_LIN(3,NUL)
		=cabpri1()
		=TIT_LIN(4)
	ENDI
	=FACRPAG3()
ENDSCAN
=FACRPAG1()
=FACRPAG2("TOTAL")
=FIN_LIN(4,CASOS)
ENDP
=FINIMP()
=IAUD(FISC)
RETURN MEN_LIN(BOTOM)
