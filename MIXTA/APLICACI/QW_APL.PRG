* зд FUNCION дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
* Ё    File Name: QW_APL.PRG                                                 Ё
* Ё       Author: G. REINER                                                  Ё
* Ё Date created: 10-25-92                                                   Ё
* Ё Time created: 09:40:09pm                                                 Ё
* Ё QUE HACE ?  : DEVUELVE TITULO Y QUERY DE APLORES                         Ё
* юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
#DEFINE NUL    0                                 && NUL
FUNCTION QW_APL
	PARAMETER REN,COL,CUAL,QUEVAR
	PRIVATE REN,COL,CUAL
	STORE NUL TO APL_SALIDA
	IF FILAPL=2
		STORE "" TO TT,FISC
		QWSALIDA=QWAPL(MIXGRL("Aplicaciones","Aplicaci╒n","Aplicaciones",.f.),cual)
		IF QWSALIDA#".F."
			QW=AT("З",QWSALIDA)
			QUEAPL=LEFT(QWSALIDA,QW-1)
			TTAPL=SUBSTR(QWSALIDA,QW+1)
			IF !EMPTY(QUEVAR)
				SHOW GET (QUEVAR)
			ELSE
				@ REN,COL SAY TTAPL
			ENDIF
		ELSE
			STORE 1 TO FILAPL
		ENDIF
	ENDIF
RETURN APL_SALIDA#2
