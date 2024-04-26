* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMENS.PRG                                                บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	ACLA=""
   STOR NUL TO CASOS
   LINEA=REPL("=",80)
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
   LINEA=REPL("=",80)
		? PADC("MENSAJES",80)
		? PADC("========",80)
		?
		?
		? "CODIGO:"
		?? MENS.CODIGO AT 20
		? "EMISOR:"
		?? MENS.EMISOR AT 20
		? "RECEPTOR:"
		?? MENS.USUARIO AT 20
		?
		? M.LINEA
		? "MENSAJE"
		? "-------"
		? MENS.MENSAJE
		? M.LINEA
		? M.LINEA
		? "RESPUESTA"
		? "---------"
		? MENS.RESPU
		?
   ENDP
   EJECT PAGE
   =FINIMP()
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
