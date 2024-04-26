* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CNS.PRG               บ
* บ COMENTARIO    :                       บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : R. 'EL BATA'\GOYO REINER บ
* บ FECHA      : 12-29-93                 บ
* บ HORA       : 08:13:00pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
*-- VERSION : R. 'EL BATA'
*-- MODIFICACIขN GOYO 05-30-92 10:24AM (VGRL POR VCNS)
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
ULPR=PROGRAM()
=CABPAN1()
SELE CNS
DO CASE
CASE BAR()=1
	DO ICNS
CASE BAR()=2
	STORE NUL TO RESPUESTA
	=IIF(EMPTY(ELICNS("a Corregir",-1,1)),.T.,CCNS())
CASE BAR()=4
	STORE NUL TO RESPUESTA
	=IIF(EMPTY(ELICNS("a Borrar",-1,1)),.T.,BCNS())
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		STORE CNSPOP TO ANTERIOR
		STORE .T. TO CNSPOP
		DO OPCNS
		SET FILTER TO DELETED()
		STORE NUL TO RESPUESTA
		=IIF(EMPTY(ELICNS("a Recuperar",-1,1)),.T.,LLCNS())
		STORE ANTERIOR TO CNSPOP
		DO OPCNS
	ENDIF
	SET FILTER TO
	SET DELE ON
	SELE CNS
CASE BAR()=8
	DO LCNSI
CASE BAR()=9
	DO LCNSP
CASE BAR()=11
	=VGRL("CNS"," CONSORCIO"," DE CONSORCIOS")
CASE BAR()=13
	DO XCNS
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
