* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    File Name: QUEIMP.PRG              �
* �       Author: G. REINER               �
* � Date created: 14/08/95 12:13          �
* �    Copyright: 1995 by GREGORIO REINER �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
FUNCTION QUEIMP
	DO CASE
	CASE TYPE("LPT1")="U" .OR. LPT1
		SET PRINTER TO LPT1
	CASE LPT2
		SET PRINTER TO LPT2
	CASE LPT3
		SET PRINTER TO LPT3
	OTHERWISE
		SET PRINTER TO LPT1
	ENDCASE
RETURN .T.
