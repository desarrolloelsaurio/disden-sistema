* ษออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : DEPCHE3.PRG                บ
* บ COMENTARIO    : DEPOSITO DE CHEQUES DE 3ง  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                   บ
* บ FECHA      : MAYO DE 1994                  บ
* บ HORA       : 01:50:15pm                    บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER       บ
* ศออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
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
