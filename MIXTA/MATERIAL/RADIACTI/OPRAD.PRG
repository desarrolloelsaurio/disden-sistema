********************************************************************************
*-- Programa: OPRAD.PRG
*-- Fecha   : 09-26-92 02:27am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE Material Radiactivo
*-- MODIF GOYO 04-28-93 02:40pm
********************************************************************************
IF ESOPEN('Material Radiactivo',1,"MIX")
	USE (PATH+'\MIXTA') ORDER TAG RADTEX ALIAS MIX
ELSE
	SET ORDER TO TAG RADTEX
ENDIF
RETU IIF(RADPOP,DEFPOMIX(RADPOPR,RADPOPC),RELEPOP("RADPOP")) .AND. MEN_LIN(BOTOM)
