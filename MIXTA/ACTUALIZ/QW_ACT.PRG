* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : QW_ACT.PRG                                               �
* � COMENTARIO    : GENERA QUERY Y TITULO PARA LISTADO DE ACTUALIZACION      �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-31-93                                                    �
* � HORA       : 08:04:55pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION QW_ACT
	PARAMETER REN,COL,CUAL
	PRIVATE REN,COL,CUAL
	IF FILACT=2
		STORE "" TO TT,FISC
		QWSALIDA=QWACT(MIXGRL("Actualizaciones","Actualizaci�n","Actualizaciones",.t.),cual)
		IF QWSALIDA#".F."
			QW=AT("�",QWSALIDA)
			QUEACT=LEFT(QWSALIDA,QW-1)
			TTACT=SUBSTR(QWSALIDA,QW+1)
			@ REN,COL SAY LEFT(TTACT,20)
		ELSE
			STORE 1 TO FILACT
		ENDIF
	ENDIF
RETURN FILACT=1
