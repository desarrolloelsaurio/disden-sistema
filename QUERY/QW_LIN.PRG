* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_LIN.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE LINEAS                          �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_LIN
PARAMETER QW_REN,QW_COL,QW_COSA
PRIVATE QW_REN,QW_COL,QW_COSA
IF FILLIN=2
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELILIN("A LISTAR",QW_REN,QW_COL))
      TTLIN='LINEA: '+ALLTRIM(MIX.TEXTO1)
      STORE QW_COSA+'="'+LEFT(MIX.TEXTO2,2)+'"' TO QUELIN
      @ QW_REN,QW_COL SAY ALLTRIM(MIX.TEXTO1)
   ELSE
      STORE 1 TO FILLIN
   ENDIF
ENDIF
RETURN FILLIN=1
