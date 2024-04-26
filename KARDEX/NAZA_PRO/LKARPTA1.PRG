* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARPTA1.PRG                                             บ
* บ COMENTARIO    : CUERPO DEL LISTADO                                       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-16-93                                                    บ
* บ HORA       : 11:16:22AM                                                  บ
* บ COPYRIGHT  : 1993 BY GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LKARPTA1
	? FECHAOP
	??PAIP
	IF TIPO=LEFT(TELLA,1)
		?? LEFT(TEL.TELA,IIF(PORPAN,15,30))
	ELSE
		?? LEFT(AVI.AVIOS,IIF(PORPAN,15,30))
	ENDIF
	SELE KAR
	?? PAIP
	?? LEFT(MIX.TEXTO1,IIF(PORPAN,14,20))
	??PAIP
	??LEFT(DETALLE,IIF(PORPAN,17,30))
	??PAIP
	IF !EMPTY(ENTRADA)
		??STR(ENTRADA,IIF(PORPAN,12,XACDIGI))
		STORE SUMA+ENTRADA TO SUMA
	ELSE
		IF !EMPTY(SALIDA)
			?? STR(0-SALIDA,IIF(PORPAN,12,XACDIGI))
			STORE RESTA+SALIDA TO RESTA
		ELSE
			?? PADC("----",IIF(PORPAN,12,XACDIGI))
		ENDIF
	ENDIF
	??PAIP
RETURN .T.
