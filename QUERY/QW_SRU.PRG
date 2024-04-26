* ÚÄ FUNCION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_SRU.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-25-92                                                   ³
* ³ Time created: 09:40:09pm                                                 ³
* ³ QUE HACE ?  : DEVUELVE TITULO Y QUERY DE SUBRUBROS                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION QW_SRU
PARAMETER QW_REN,QW_COL,QW_COSA,ELQRUB
PRIVATE QW_REN,QW_COL,QW_COSA,ELQRUB
IF FILSRU=2
   STORE NUL TO RESPUESTA
   QW_SAL=IIF(TYPE("ELQRUB")="L",ELISRU("",QW_REN,QW_COL),ELISRU1('',QW_REN,QW_COL,ELQRUB))
   IF !EMPTY(QW_SAL)
      TTSRU='SUBRUBRO: '+ALLTRIM(RUB.RUBRO)
      STORE QW_COSA+'="'+zero(RUB.CODSRUB,3)+'"' TO QUESRU
      @ QW_REN,QW_COL SAY ALLTRIM(RUB.RUBRO)
   ELSE
      STORE 1 TO FILSRU
   ENDIF
ENDIF
RETURN FILSRU=1
