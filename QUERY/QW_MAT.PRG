* 旼 FUNCION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_MAT.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:40:09pm                                                 �
* � QUE HACE ?  : DEVUELVE TITULO Y QUERY DE MATORES                         �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
#DEFINE NUL    0                                 && NUL
FUNCTION QW_MAT
PARAMETER REN,COL,CUAL,QUEVAR,LARESP
PRIVATE REN,COL,CUAL
STORE NUL TO MAT_SALIDA
LARESP=IIF(EMPTY(LARESP),2,LARESP)
IF FILMAT=LARESP
   STORE "" TO TT,FISC
   QWSALIDA=QWMAT(MIXGRL(MADERS,MADER,MADERS,.f.),cual)
   IF QWSALIDA#".F."
      QW=AT("�",QWSALIDA)
      QUEMAT=LEFT(QWSALIDA,QW-1)
      TTMAT=SUBSTR(QWSALIDA,QW+1)
      IF !EMPTY(QUEVAR)
      SHOW GET (QUEVAR)
      ELSE
      @ REN,COL SAY TTMAT
      ENDIF
   ELSE
      STORE 1 TO FILMAT
   ENDIF
ENDIF
RETURN MAT_SALIDA#LARESP
