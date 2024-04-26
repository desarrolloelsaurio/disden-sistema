* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SI.PRG                                                   บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-14-93                                                    บ
* บ HORA       : 01:19:11am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION SI
	PARAMETER S_LARGO,S_TEXTO,S_LIN1,S_LIN2,S_VALOR
	S_TEXTO=IIF(EMPTY(S_TEXTO),"SALDO INICIAL",S_TEXTO)
	S_VALOR=IIF(EMPTY(S_VALOR),SI,S_VALOR)
	IF S_LIN1
		? REPL("-",S_LARGO)
	ENDIF
	? "!      !      ! "
	?? PADR(S_TEXTO,S_LARGO-55)
	?? PAIPD
	IF S_VALOR>0
		?? TRAN(S_VALOR,PICU9)
		?? PAIP2
		?? TRAN(0,PICU9)
	ELSE
		?? TRAN(0,PICU9)
		?? PAIP2
		?? TRAN(ABS(S_VALOR),PICU9)
	ENDIF
	?? PAIPI
	IF S_LIN2
		? REPL("-",S_LARGO)
	ENDIF
RETURN
