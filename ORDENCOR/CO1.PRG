***********************************************
*-- Programa: CO1.PRG
*-- Fecha   : 06/26/91 10:19am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE ORDENES
*--           DE CORTE - MERCADERIAS
***********************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
CO1_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
SELE COR
DO CASE
CASE CO1_DIJO="Ingresa - Agrega"
	=OPDES()
	DO ICO1.SPR with "Mercader¡a de Ordenes de Corte",.T.,.F.,.F.,.T.
CASE CO1_DIJO=="Corrige Fecha Finalizaci¢n"
    DO ICor_do.SPR WITH "Corregir Fecha Finalizaci¢n",10
CASE CO1_DIJO=="Corrige Tipo de Estructura"
    DO ICor_do.SPR WITH "Corregir Tipo de Estructura",11
CASE co1_dijo="Corrige"
   STORE NUL TO respuesta
   =IIF(EMPTY(elicor(" a Corregir",-1,1,'N')),.T.,Cco1())
CASE co1_dijo="Anula"
   DO BCOR
CASE co1_dijo="Lista por Impresora"
   DO LCO1 WITH .F.
CASE co1_dijo="Lista por Pantalla"
   DO LCO1 WITH .T.
CASE co1_dijo="Restaura el Archivo"
   DO XCOR
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
