********************************************************************************
*-- Programa: opkar.prg
*-- Fecha   : 04-30-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE OPERACIONES DE KARDEX
********************************************************************************
IF ESOPEN("Operaciones de Kardex",1,"MIX")
	USE (PATHPRO+'\MIXTA') ORDER TAG opkTEX ALIAS mix
ELSE
	SET ORDER TO TAG opkTEX
ENDIF
RETURN IIF(OPKpop,DEFPOMIX(OPKpopr,OPKpopc),.T.) .AND. men_lin(botom)
