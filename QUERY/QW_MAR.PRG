* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_MAR.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE MARCAS                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_MAR
PARAMETER QW_REN,QW_COL,QW_COSA
PRIVATE QW_REN,QW_COL,QW_COSA
IF FILMAR=2
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIMAR("A LISTAR",QW_REN,QW_COL))
      TTMAR='MARCA: '+ALLTRIM(MI1.TEXTO1)
      STORE QW_COSA+'="'+LEFT(MI1.TEXTO2,2)+'"' TO QUEMAR
      @ QW_REN,QW_COL SAY ALLTRIM(MI1.TEXTO1)
   ELSE
      STORE 1 TO FILMAR
   ENDIF
ENDIF
RETURN FILMAR=1
