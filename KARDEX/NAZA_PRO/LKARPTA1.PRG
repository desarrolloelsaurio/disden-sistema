* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LKARPTA1.PRG                                             �
* � COMENTARIO    : CUERPO DEL LISTADO                                       �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-16-93                                                    �
* � HORA       : 11:16:22AM                                                  �
* � COPYRIGHT  : 1993 BY GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
