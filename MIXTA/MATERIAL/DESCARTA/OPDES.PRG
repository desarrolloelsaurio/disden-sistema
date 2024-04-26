********************************************************************************
*-- Programa: OPDES.PRG
*-- Fecha   : 09-26-92 03:28am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE Material Descartable
*-- MODIF GOYO 04-28-93 02:41pm
********************************************************************************
IF ESOPEN('Material Descartable',1,"MIX")
	USE (PATH+'\MIXTA') ORDER TAG DESTEX ALIAS MIX
ELSE
	SET ORDER TO TAG DESTEX
ENDIF
RETURN IIF(DESPOP,DEFPOMIX(DESPOPR,DESPOPC),.T.) .AND. MEN_LIN(BOTOM)
