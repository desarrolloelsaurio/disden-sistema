************************************************
*-- Programa: LEGCOR
*-- Fecha   : MAYO DE 1994
*-- Version : G. REINER
*-- Notas   : LEGAJO DE ORDENES DE CORTE
************************************************
CC_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
SELE COR
DO CASE
CASE CC_DIJO="Ingresa"
   DO LEGCOR.SPR
CASE CC_DIJO="Consulta"
   DO CLEGCOR.SPR
CASE CC_DIJO="Listado de un Legajo"
   DO LLEGCOR
CASE CC_DIJO="Ordenes de Corte con Legajo"
   =WORKING()
   =DOTALK()
   =OPMER()
   SELE COR
   TMP=GENTMP()
   =FLOCK("COR") .OR. FLOK("COR")
   SORT ON NUMERO TO (TMP) FOR !EMPTY(LEGAJO)
   SELE 0
   USE (TMP) ALIAS TMP
   TT="Listado de Ordenes de Corte con Informaci¢n en el Legajo"
   ACLA=PAIP+;
   PADC("O.C.",6)+;
   PAIP+;
   PADC("ARTICULO",10)+;
   PAIP+;
   PADC("DESCRIPCION",20)+;
   PAIP+;
   PADC("LEGAJO",30)
   =UNTALK()
   =UNWORK()
   DO LGRLP WITH "TMP","LLEGCOR0()","","LLEGCOR1"
   =BORTEMP(DBF())
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
