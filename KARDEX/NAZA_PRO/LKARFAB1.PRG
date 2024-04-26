* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARFAB1.PRG                                             บ
* บ COMENTARIO    : CUERPO DEL LISTADO LKARFAB                               บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 11:59:04am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
? fechaop
?? PAIP
IF TIPO=LEFT(TELLA,1)
	?? LEFT(TEL.TELA,IIF(PORPAN,15,30))
ELSE
	?? LEFT(AVI.AVIOs,IIF(PORPAN,15,30))
ENDIF
?? PAIP
IF EMPTY(KAR.TALCOD)
	?? PADR('DEPOSITO/FABRIC',IIF(PORPAN,15,30))
ELSE
	?? LEFT(tal.talleres,IIF(PORPAN,15,30))
ENDIF
??PAIP
??LEFT(MIX.TEXTO1,15)
??PAIP
IF !EMPTY(entrada)
	??STR(entrada,IIF(PORPAN,12,XACDIGI))
	STORE suma+entrada TO suma
ELSE
	IF !EMPTY(salida)
		?? STR(0-salida,IIF(PORPAN,12,XACDIGI))
		STORE resta+salida TO resta
	ELSE
		?? padc("----",IIF(PORPAN,12,XACDIGI))
	ENDIF
ENDIF
??PAIP
RETURN .T.
