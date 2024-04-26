************************************
*-- Programa: OPIMP.PRG
*-- Fecha   : 08-27-92 12:37pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO Impuestos
*-- MODIF GOYO 04-28-93 02:47pm
************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG IMPTEX
ELSE
	=MEN_LIN(ABA+'Impuestos')
	SELE 1
	USE (pathpro+'\MIXTA') ORDER TAG IMPTEX ALIAS mix
ENDIF
RETURN IIF(IMPpop,DEFPOMIX(IMPpopr,IMPpopc),.T.) .AND. MEN_LIN(BOTOM)
