* 浜様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : DEPCHE3.PRG                �
* � COMENTARIO    : DEPOSITO DE CHEQUES DE 3�  �
* 麺様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                   �
* � FECHA      : MAYO DE 1994                  �
* � HORA       : 01:50:15pm                    �
* � COPYRIGHT  : 1993 by GREGORIO REINER       �
* 藩様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

ULPR=HORA_ULP(PROGRAM())
=CHEQSEG()
STORE NUL TO RESPUESTA
IF !EMPTY(ELIBAN("a Depositar",-1,1))
	=POPCARTE("_*_"+CRLF+;
		"BANCO:"+MIX.TEXTO1+CRLF+;
		"-"+CRLF+;
		"CUENTA:"+MIX.TEXTO2+CRLF+;
		"-*-")
	=RELEWIN("POPCARTE")
ENDIF
RETURN MEN_LIN(BOTOM)
