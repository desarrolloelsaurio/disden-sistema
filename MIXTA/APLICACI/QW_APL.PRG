* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_APL.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE APLORES                         �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
#DEFINE NUL    0                                 && NUL
FUNCTION QW_APL
	PARAMETER REN,COL,CUAL,QUEVAR
	PRIVATE REN,COL,CUAL
	STORE NUL TO APL_SALIDA
	IF FILAPL=2
		STORE "" TO TT,FISC
		QWSALIDA=QWAPL(MIXGRL("Aplicaciones","Aplicaci줻","Aplicaciones",.f.),cual)
		IF QWSALIDA#".F."
			QW=AT("�",QWSALIDA)
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
