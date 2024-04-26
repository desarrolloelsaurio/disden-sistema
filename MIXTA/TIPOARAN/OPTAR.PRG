********************************************
*-- Programa: OPPRV.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO TIPOS DE ARANCEL
*** VERSION LABORATORIOS
*-- MODIF GOYO 04-28-93 03:01pm
*********************************************
IF ESOPEN("Tipos de Arancel",1,"MIX")
	USE (PATHPRO+'\MIXTA') ORDER TAG TARTEX ALIAS MIX
ELSE
	SET ORDER TO TAG TARTEX
ENDIF
IF TARPOP
	=DEFPOMIX(TARPOPR,TARPOPC)
ENDIF
=MEN_LIN(BOTOM)
RETURN
