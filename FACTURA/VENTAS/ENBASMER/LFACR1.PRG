* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴커
* �    File Name: LFACR1.PRG          �
* �       Author: G. REINER           �
* � Date created: 02-06-93            �
* �    Copyright: 1993 by GOYO REINER �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
FUNCTION LFACR1
	DO CASE
	CASE FILFAC=3
		RETURN FAX.FACTURA
	CASE FILFEC=3
		RETURN FAC.FECHAEM
	CASE FILVIA=3
		RETURN FAC.CODVIA
	CASE FILCLI=3
		RETURN FAC.CODCLI
	CASE FILPAG=3
		RETURN MIX.TEXTO1
	ENDCASE
RETURN ""
