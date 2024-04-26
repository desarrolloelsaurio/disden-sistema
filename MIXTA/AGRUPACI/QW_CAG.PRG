* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : QW_CAG.PRG                                               บ
* บ COMENTARIO    : GENERA QUERY Y TITULOS PARA LISTADOS POR CONC. ACTUALIZ. บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-31-93                                                    บ
* บ HORA       : 08:09:55pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION QW_CAG
	PARAMETER REN,COL,CUAL
	PRIVATE REN,COL,CUAL
	IF FILCAG=2
		STORE "" TO TT,FISC
		IF _WINDOWS

****wait  "*1" wind

   		   QWSALIDA=QWCAG(MIXGRL("Conc. Agrupaci๓n",;
		   "Agrupaci๓n",;
		   "Conc. Agrupaci๓n"),cual)		
		   
*****wait   "*2" wind

		ELSE
		   QWSALIDA=QWCAG(MIXGRL("Conc. Agrupaciขn","Agrupaciขn","Conc. Agrupaciขn",.t.),cual)
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
