* ÚÄ FUNCION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_RUBR.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-25-92                                                   ³
* ³ Time created: 09:40:09pm                                                 ³
* ³ QUE HACE ?  : DEVUELVE TITULO Y QUERY DE RUBROS                          ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION QW_RUBR
PARAMETER QW_REN,QW_COL,QW_COSA
PRIVATE QW_REN,QW_COL,QW_COSA
IF FILRUB=2
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIRUB("A LISTAR",QW_REN,QW_COL))
      TTRUB='RUBRO: '+ALLTRIM(RUB.RUBRO)
      STORE QW_COSA+'="'+zero(RUB.CODRUB,3)+'"' TO QUERUB
      @ QW_REN,QW_COL SAY ALLTRIM(RUB.RUBRO)
   ELSE
      STORE 1 TO FILRUB
   ENDIF
ENDIF
RETURN FILRUB=1
