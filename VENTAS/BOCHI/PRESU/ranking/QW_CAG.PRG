* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : QW_CAG.PRG                                               �
* � COMENTARIO    : GENERA QUERY Y TITULOS PARA LISTADOS POR CONC. ACTUALIZ. �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-31-93                                                    �
* � HORA       : 08:09:55pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION QW_CAG
	PARAMETER REN,COL,CUAL
	PRIVATE REN,COL,CUAL
	IF FILCAG=2
		STORE "" TO TT,FISC
		IF _WINDOWS

****wait  "*1" wind

   		   QWSALIDA=QWCAG(MIXGRL("Conc. Agrupaci�n",;
		   "Agrupaci�n",;
		   "Conc. Agrupaci�n"),cual)		
		   
*****wait   "*2" wind

		ELSE
		   QWSALIDA=QWCAG(MIXGRL("Conc. Agrupaci�n","Agrupaci�n","Conc. Agrupaci�n",.t.),cual)
		ENDIF
		IF QWSALIDA#".F."
			QW=AT(CHR(250),QWSALIDA)
			QUECAG=LEFT(QWSALIDA,QW-1)
			TTCAG=SUBSTR(QWSALIDA,QW+1)
			IF !EMPTY(REN)
			@ REN,COL SAY LEFT(TTCAG,20)
			ENDIF
		ELSE
			STORE 1 TO FILCAG
		ENDIF
	ENDIF
RETURN FILCAG=1
