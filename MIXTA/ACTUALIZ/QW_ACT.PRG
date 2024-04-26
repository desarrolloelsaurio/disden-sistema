* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : QW_ACT.PRG                                               บ
* บ COMENTARIO    : GENERA QUERY Y TITULO PARA LISTADO DE ACTUALIZACION      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-31-93                                                    บ
* บ HORA       : 08:04:55pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION QW_ACT
	PARAMETER REN,COL,CUAL
	PRIVATE REN,COL,CUAL
	IF FILACT=2
		STORE "" TO TT,FISC
		QWSALIDA=QWACT(MIXGRL("Actualizaciones","Actualizaciขn","Actualizaciones",.t.),cual)
		IF QWSALIDA#".F."
			QW=AT("๚",QWSALIDA)
			QUEACT=LEFT(QWSALIDA,QW-1)
			TTACT=SUBSTR(QWSALIDA,QW+1)
			@ REN,COL SAY LEFT(TTACT,20)
		ELSE
			STORE 1 TO FILACT
		ENDIF
	ENDIF
RETURN FILACT=1
