* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARP0.PRG                                               บ
* บ COMENTARIO    : CUERPO DEL LISTADO DE KARDEX                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 01:02:50am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
