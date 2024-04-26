**********************************************
*-- Programa: OPALI.PRG
*-- Fecha   : 11/08/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ALIMENTACION
**********************************************
IF USED("MI1")
   SELE MI1
   SET ORDER TO TAG ALITEX
ELSE
   =MEN_LIN(ABA+"Alimentaci¢n")
   SELE 2
   USE (PATH+'\MIXTA1') ORDER TAG ALITEX ALIAS MI1
ENDIF
RETURN IIF(ALIPOP,DEFPOMI1(ALIPOPR,ALIPOPC),.T.) .AND. MEN_LIN(BOTOM)
