* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴커
* �    File Name: LFACPU1.PRG         �
* �       Author: G. REINER           �
* � Date created: 12-25-92            �
* � Time created: 10:36:23am          �
* �    Copyright: 1992 by GOYO REINER �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
FUNCTION LFACPU1
	PARAMETER IMPRIME
	IF IMPRIME
		? PAIP
		?? KODCLI
		?? PAIP
		?? KLIENTE
		?? PAIP
		?? FEKHA
		?? PAIP
		?? IIF(TYPE("FAC.FACTURA")="C",RIGHT(ALLTRIM(FAKTURA),10),STR(FAKTURA,10))
		?? PAIP
	ENDIF
	KODCLI=FAC.CODCLI
	KLIENTE=PER.CLIENTE
	FEKHA=FAC.FECHAEM
	FAKTURA=FAC.FACTURA
RETURN .T.
