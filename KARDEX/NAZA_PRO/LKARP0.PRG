* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKARP0.PRG                                               �
* � COMENTARIO    : CUERPO DEL LISTADO DE KARDEX                             �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 01:02:50am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION LKARP0
	?PAIP
	?? STR(RECNO(),6)
	??PAIP
	?? fechaop
	??PAIP
	IF !EMPTY(KAR.TALLER)
		=XSEEK(kar.taller,'TAL','TALCOD')
		?? LEFT(tal.talleres,IIF(PORPAN,15,40))
	ELSE
		?? PADR('DEPOSITO/FABRIC',IIF(PORPAN,15,40))
	ENDIF
	??PAIP
	??PADR(SAYMIX(KAR.OPK,'OPKCOD'),IIF(PORPAN,14,20))
	??PAIP
	??LEFT(detalle,IIF(PORPAN,17,30))
	??PAIP
	IF !EMPTY(entrada)
		?? STR(entrada,IIF(PORPAN,12,XACDIGI))
		STORE suma+entrada TO suma
	ELSE
		IF !EMPTY(salida)
		??STR(0-SALIDA,IIF(PORPAN,12,XACDIGI))
			STORE resta+salida TO resta
		ELSE
			?? padc("----",IIF(PORPAN,12,XACDIGI))
		ENDIF
	ENDIF
	??PAIP
RETURN .T.
