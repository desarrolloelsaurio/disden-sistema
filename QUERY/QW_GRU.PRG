* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_GRU.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE GRUPOS                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_GRU
PARAMETER QW_REN,QW_COL,QW_COSA
PRIVATE QW_REN,QW_COL,QW_COSA
IF FILGRU=2
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIGRU("A LISTAR",QW_REN,QW_COL))
      TTGRU='GRUPO DE COMPRAS: '+ALLTRIM(MIX.TEXTO1)
      STORE QW_COSA+'="'+LEFT(MIX.TEXTO2,2)+'"' TO QUEGRU
      @ QW_REN,QW_COL SAY ALLTRIM(MIX.TEXTO1)
   ELSE
      STORE 1 TO FILGRU
   ENDIF
ENDIF
RETURN FILGRU=1
