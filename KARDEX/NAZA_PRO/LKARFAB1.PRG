* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKARFAB1.PRG                                             �
* � COMENTARIO    : CUERPO DEL LISTADO LKARFAB                               �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 11:59:04am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
