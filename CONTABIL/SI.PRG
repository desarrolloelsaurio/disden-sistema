* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : SI.PRG                                                   �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-14-93                                                    �
* � HORA       : 01:19:11am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
