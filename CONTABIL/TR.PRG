* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : TR.PRG                                                   �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-14-93                                                    �
* � HORA       : 01:19:03am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
