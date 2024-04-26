* ÚÄ FUNCION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_GRU.PRG                                                 ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-25-92                                                   ³
* ³ Time created: 09:40:09pm                                                 ³
* ³ QUE HACE ?  : DEVUELVE TITULO Y QUERY DE GRUPOS                          ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
