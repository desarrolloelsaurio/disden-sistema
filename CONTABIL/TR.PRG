* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TR.PRG                                                   บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-14-93                                                    บ
* บ HORA       : 01:19:03am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION TR
PARAMETER LARGOR,S_TEXTO,S_LIN1,S_LIN2
IF S_LIN1
	? REPL("-",LARGOR)
ENDIF
? "!      !      ! "
?? PADR(S_TEXTO,LARGOR-93)
?? PAIPD
?? tran(SDEU,PICU9)
?? PAIP2
?? tran(SHAB,PICU9)
?? PAIP2
if SI>0
	?? tran(SI,PICU9)
	?? PAIP2
	?? tran(0,PICU9)
else
	?? tran(0,PICU9)
	?? PAIP2
	?? tran(ABS(SI),PICU9)
endif
?? PAIPI
IF S_LIN2
	? REPL("-",LARGOR)
ENDIF
RETURN
