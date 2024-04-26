****************************************************
*-- Programa: OPgas.PRG
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO gastos
****************************************************
IF ESOPEN("Gastos",1,"MIX")
	USE (pathcns+'\MIXTA') ORDER TAG GASTEX ALIAS mix
ELSE
	SET ORDER TO TAG GASTEX
ENDIF
RETURN IIF(gaspop,DEFPOMIX(gaspopr,gaspopc),.T.) .AND. men_lin(BOTOM)
