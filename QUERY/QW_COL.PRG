* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_COL.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE COLORES                         �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
#DEFINE NUL    0                                 && NUL
FUNCTION QW_COL
PARAMETER REN,COL,CUAL,QUEVAR,LARESP
PRIVATE REN,COL,CUAL
STORE NUL TO COL_SALIDA
LARESP=IIF(EMPTY(LARESP),2,LARESP)
IF FILCOL=LARESP
   STORE "" TO TT,FISC
   QWSALIDA=QWCOL(MIXGRL("Colores","Color","Colores",.t.),cual)
   IF QWSALIDA#".F."
      QW=AT("�",QWSALIDA)
      QUECOL=LEFT(QWSALIDA,QW-1)
      TTCOL=SUBSTR(QWSALIDA,QW+1)
      IF !EMPTY(QUEVAR)
      SHOW GET (QUEVAR)
      ELSE
      @ REN,COL SAY TTCOL
      ENDIF
   ELSE
      STORE 1 TO FILCOL
   ENDIF
ENDIF
RETURN COL_SALIDA#LARESP
